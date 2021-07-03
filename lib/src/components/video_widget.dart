import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtubegetxpro/model/video.dart';
import 'package:intl/intl.dart';
import 'package:youtubegetxpro/src/Controller/video_controller.dart';

class VideoWidget extends StatefulWidget {
  final Video? video;

  const VideoWidget({Key? key, this.video}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoController? _videoController;

  Widget _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, //height 대신 이렇게 주면 가로에 꽉 찬다.
      children: [
        Container(
          // height: 220,
          color: Colors.grey,
          child: CachedNetworkImage( // placeholder을 사용하기 위해 쓴다. 인디케이터도 제공해줌
            imageUrl: widget.video!.snippet!.thumbnails!.medium!.url!,
            placeholder: (context, url) => Container(
              height: 230,
              child: Center(child: CircularProgressIndicator()),
            ),fit: BoxFit.fitWidth,
          ),
          // child: Image.network(
          //   widget.video!.snippet!.thumbnails!.medium!.url!,
          //   fit: BoxFit.fitWidth,
          // ),
        ),
      ],
    );
  }

  Widget _simpleDetailinfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 20, top: 10),
      child: Row(
        children: [
          Obx(
            () => CircleAvatar(
              radius: 30, // 크기를 조정
              // 이미지를 Provider로 받아옴. 이미지 주소 복사 해서 붙여넣음
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage: Image.network(_videoController!.youtuberthumbnailUrl!).image,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(widget.video!.snippet!.title!),
                    ),
                    IconButton(alignment: Alignment.topCenter, icon: Icon(Icons.more_vert), onPressed: () {})
                  ],
                ),
                Row(
                  children: [
                    Text(widget.video!.snippet!.channelTitle!, style: TextStyle(fontSize: 12, color: Colors.black87)),
                    Text(" ㆍ "),
                    Obx(
                      () => Text(
                        _videoController!.viewCountString,
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ),
                    // Text(
                    //   "",
                    //   style: TextStyle(fontSize: 12, color: Colors.black54),
                    // ),
                    Text(" ㆍ "),
                    Text(DateFormat("yyyy-mm-dd").format(widget.video!.snippet!.publishTime!),
                        style: TextStyle(fontSize: 12, color: Colors.black54))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    _videoController = Get.put(VideoController(video: widget.video),
        tag: widget.video!.id!.videoId); // tag 고유한 아이디를 부여하여 여러개의 initialized 한다.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [_thumbnail(), _simpleDetailinfo()],
      ),
    );
  }
}
