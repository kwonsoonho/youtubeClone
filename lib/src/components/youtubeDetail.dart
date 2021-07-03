import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class YoutubeDetail extends StatelessWidget {
  const YoutubeDetail({Key? key}) : super(key: key);

  Widget _titleZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "제목이 올자리",
            style: TextStyle(fontSize: 15),
            maxLines: 2,
          ),
          Row(
            children: [
              Text("조회수 1000회", style: TextStyle(fontSize: 12, color: Colors.black54)),
              Text(" ㆍ "),
              Text("2021-07-03", style: TextStyle(fontSize: 12, color: Colors.black54))
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
        "data data datadatadatadatadatadatadatadatadatadatadata datadatadatadatadatadatadatadatadatadatadata",
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
        _buttonOne("like", "1000"),
        _buttonOne("dislike", "0"),
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
            backgroundImage: Image.network("https://dimg.donga.com/wps/NEWS/IMAGE/2021/01/17/104953245.2.jpg").image,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "채널이름",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "구독자 10000",
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
          Container(
            height: 250,
            color: Colors.grey,
          ),
          Expanded(child: _description())
        ],
      ),
    );
  }
}
