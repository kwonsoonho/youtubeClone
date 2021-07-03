import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({Key? key}) : super(key: key);

  Widget _thumbnail() {
    return Container(
      height: 250,
      color: Colors.grey,
    );
  }

  Widget _simpleDetailinfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10,bottom: 20,top: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30, // 크기를 조정
            // 이미지를 Provider로 받아옴. 이미지 주소 복사 해서 붙여넣음
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage: Image.network("https://dimg.donga.com/wps/NEWS/IMAGE/2021/01/17/104953245.2.jpg").image,
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "제목이 올자리 제목이 올자리제목이 올자리제목이 올자리제목이 올자리",
                        maxLines: 2,
                      ),
                    ),
                    IconButton(
                        alignment: Alignment.topCenter,
                        icon: Icon(Icons.more_vert), onPressed: () {})
                  ],
                ),
                Row(
                  children: [
                    Text("이름", style: TextStyle(fontSize: 12, color: Colors.black87)),
                    Text(" ㆍ "),
                    Text("조회수 1000회", style: TextStyle(fontSize: 12, color: Colors.black54)),
                    Text(" ㆍ "),
                    Text("2021-07-03", style: TextStyle(fontSize: 12, color: Colors.black54))
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
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [_thumbnail(), _simpleDetailinfo()],
      ),
    );
  }
}
