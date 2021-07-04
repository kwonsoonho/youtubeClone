import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:youtubegetxpro/model/statistics.dart';
import 'package:youtubegetxpro/model/youtube_video_result.dart';
import 'package:youtubegetxpro/model/youtuber.dart';

class YoutubeRepsository extends GetConnect {
  static YoutubeRepsository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  Future<YoutubeVideoResult> loadVideos(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCbMGBIayK26L4VaFrs5jyBw&maxResults=10&order=date&videoDefinition"
        "=high&type=video&key=AIzaSyDHzmsH15YP7d7yjwR19nk5OJbAoqrcSIw&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
    return Future.error(response.statusText!);
  }

  Future<Statistics> getVideoInfoById(String videoId) async {
    String url =
        "/youtube/v3/videos?part=snippet,statistics&key=AIzaSyDHzmsH15YP7d7yjwR19nk5OJbAoqrcSIw&id=$videoId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String,dynamic> data = response.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      }
    }
    return Future.error(response.statusText!);
  }

  Future<Youtuber> getYoutuberInfoById(String channelId) async {
    String url =
        "/youtube/v3/channels?part=statistics,snippet&key=AIzaSyDHzmsH15YP7d7yjwR19nk5OJbAoqrcSIw&id=$channelId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String,dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      }
    }
    return Future.error(response.statusText!);
  }

  Future<YoutubeVideoResult> search(String searchKeyword,String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&maxResults=10&order=date&videoDefinition"
        "=high&type=video&key=AIzaSyDHzmsH15YP7d7yjwR19nk5OJbAoqrcSIw&pageToken=$nextPageToken&q=$searchKeyword";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
    return Future.error(response.statusText!);
  }

}
