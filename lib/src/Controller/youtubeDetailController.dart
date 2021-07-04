import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtubegetxpro/src/Controller/video_controller.dart';

class YoutubeDetailController extends GetxController {
  VideoController? videoController;
  YoutubePlayerController? playerController;

  @override
  void onInit() {
    videoController = Get.find(tag: Get.parameters["videoID"]);
    playerController = YoutubePlayerController(
      initialVideoId: Get.parameters["videoID"]!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    super.onInit();
  }

  String? get title => videoController!.video!.snippet!.title;

  String? get description => videoController!.video!.snippet!.description;

  String? get viewCount => "조회수 ${videoController!.statistics.value.viewCount}회";

  String? get likeCount => "${videoController!.statistics.value.likeCount}";

  String? get dislikeCount => "${videoController!.statistics.value.dislikeCount}";
  String? get youtuberThumnailUrl => videoController!.youtuberthumbnailUrl;
  String? get youtuberName => videoController!.youtuber.value.snippet!.title;

  String? get createDate => DateFormat("yyyy-mm-dd").format(videoController!.video!.snippet!.publishTime!);
}
