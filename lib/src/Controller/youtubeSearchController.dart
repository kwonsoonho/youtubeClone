import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtubegetxpro/model/youtube_video_result.dart';
import 'package:youtubegetxpro/src/repository/youtube_repository.dart';

class YoutubeSearchController extends GetxController {
  String key = "SearchKey";

  // RxList<String> history = [""].obs;
  RxList<String> history = RxList<String>.empty(growable: true);
  Set<String>? originHistory = {};
  SharedPreferences? profs;
  ScrollController scrollController = ScrollController();
  String? _currentKeyword;
  Rx<YoutubeVideoResult>? youtubeVideoResult = YoutubeVideoResult(items: []).obs;

  @override
  void onInit() async {
    profs = await SharedPreferences.getInstance();
    List<dynamic> initdata = profs!.getStringList(key)!;
    history(initdata.map((e) => e.toString()).toList());
    _event();
    super.onInit();
  }

  void submitSearch(String search) {
    history.addIf(!history.contains(search), search);
    profs!.setStringList(key, history);
    _currentKeyword = search;
    _searchYoutube(search);
  }

  void _event() {
    scrollController.addListener(() {
      // print(scrollController.position.maxScrollExtent);
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
          youtubeVideoResult!.value.nextPagetoken != "") {
        print("reload");
        _searchYoutube(_currentKeyword!);
      }
    });
  }

  void _searchYoutube(String search) async {
    YoutubeVideoResult youtubeVideoResultFromServer =
        await YoutubeRepsository.to.search(search, youtubeVideoResult!.value.nextPagetoken ?? "");
    // print(youtubeVideoResult.items!.length);
    youtubeVideoResult!(youtubeVideoResultFromServer);

    if (youtubeVideoResult != null && youtubeVideoResultFromServer.items != null && youtubeVideoResultFromServer.items!.length > 0) {
      youtubeVideoResult!.update((item) {
        item!.nextPagetoken = youtubeVideoResultFromServer.nextPagetoken;
        item.items!.addAll(youtubeVideoResultFromServer.items!);
      });
    }

  }
}
