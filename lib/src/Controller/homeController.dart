import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:youtubegetxpro/model/youtube_video_result.dart';
import 'package:youtubegetxpro/src/repository/youtube_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    _videoLoad();
    _event();
    super.onInit();
  }

  void _videoLoad() async {
    YoutubeVideoResult youtubeVideoResult =
        await YoutubeRepsository.to.loadVideos(youtubeResult.value.nextPagetoken ?? "");
    // print(youtubeVideoResult.items!.length);

    if (youtubeVideoResult != null && youtubeVideoResult.items != null && youtubeVideoResult.items!.length > 0) {
      youtubeResult.update((item) {
        item!.nextPagetoken = youtubeVideoResult.nextPagetoken;
        item.items!.addAll(youtubeVideoResult.items!);
      });
    }
  }

  void _event() {
    scrollController.addListener(() {
      // print(scrollController.position.maxScrollExtent);
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent && youtubeResult.value.nextPagetoken != "") {
        print("reload");
        _videoLoad();
      }
    });
  }
}
