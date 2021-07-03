import 'package:get/get.dart';
import 'package:youtubegetxpro/model/statistics.dart';
import 'package:youtubegetxpro/model/video.dart';
import 'package:youtubegetxpro/model/youtuber.dart';
import 'package:youtubegetxpro/src/repository/youtube_repository.dart';

class VideoController extends GetxController {
  Video? video;

  VideoController({this.video});

  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit() async {
    Statistics loadStatistics = await YoutubeRepsository.to.getVideoInfoById(video!.id!.videoId!);
    statistics(loadStatistics);
    Youtuber loadYoutuber = await YoutubeRepsository.to.getYoutuberInfoById(video!.snippet!.channelId!);
    youtuber(loadYoutuber);
    super.onInit();
  }

  String get viewCountString => "조회수 ${statistics.value.viewCount ?? '-'}회";

  String? get youtuberthumbnailUrl {
    if(youtuber.value.snippet == null) return "https://pbs.twimg.com/media/ExUElF7VcAMx7jx.jpg";
    return youtuber.value.snippet!.thumbnails!.medium!.url;
  }
}
