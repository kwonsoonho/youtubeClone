import 'package:youtubegetxpro/model/video.dart';

class YoutubeVideoResult {
  int? totalResults;
  int? resultPerPage;
  String? nextPagetoken;
  List<Video>? items;

  YoutubeVideoResult({this.totalResults, this.nextPagetoken, this.resultPerPage, this.items});

  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) => YoutubeVideoResult(
        totalResults: json["pageInfo"]["totalResults"],
        resultPerPage: json["pageInfo"]["resultsPerPage"],
        nextPagetoken: json["nextPageToken"] ?? "", // 다음페이지가 없으면 "
        items: List<Video>.from(json["items"].map((data) => Video.fromJson(data))), //데이터를 돌면서 파싱을 함.
      );
}
