import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtubegetxpro/src/Controller/youtubeDetailController.dart';

class YoutubeDetail extends GetView<YoutubeDetailController> {
  const YoutubeDetail({Key? key}) : super(key: key);

  Widget _titleZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.title!,
            style: TextStyle(fontSize: 15),
            maxLines: 2,
          ),
          Row(
            children: [
              Text(controller.viewCount!, style: TextStyle(fontSize: 12, color: Colors.black54)),
              Text(" ㆍ "),
              Text(controller.createDate!, style: TextStyle(fontSize: 12, color: Colors.black54))
            ],
          )
        ],
      ),
    );
  }

  Widget _descriptionZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        controller.description!,
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buttonOne(String icon, String label) {
    return Column(
      children: [SvgPicture.asset("assets/svg/icons/${icon}.svg"), Text(label)],
    );
  }

  Widget _bottomZone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buttonOne("like", controller.likeCount!),
        _buttonOne("dislike", controller.dislikeCount!),
        _buttonOne("share", "공유"),
        _buttonOne("save", "저장"),
      ],
    );
  }

  Widget get line => Container(
        height: 1,
        color: Colors.black12,
      );

  Widget _ownerZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            // 이미지를 Provider로 받아옴. 이미지 주소 복사 해서 붙여넣음
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage: Image.network(controller.youtuberThumnailUrl!).image,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  controller.youtuberName!,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "구독자 ${controller.videoController!.youtuber.value.statistics!.subscriberCount}",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Text(
              "구독",
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget _description() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titleZone(),
          line,
          _descriptionZone(),
          _bottomZone(),
          SizedBox(
            height: 20,
          ),
          line,
          _ownerZone()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          YoutubePlayer(
            controller: controller.playerController!,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            topActions: <Widget>[
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  controller.playerController!.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 25.0,
                ),
                onPressed: () {
                  // log('Settings Tapped!');
                },
              ),
            ],
            onReady: () {
              // _isPlayerReady = true;
            },
            onEnded: (data) {
              // _controller
              //     .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
              // _showSnackBar('Next Video Started!');
            },
          ),
          Expanded(child: _description())
        ],
      ),
    );
  }
}
