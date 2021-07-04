import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  Widget _logo() {
    return Container(
        child: Image.network(
      "https://static.toiimg.com/photo/58623495.cms",
      width: 100,
    ));
  }

  Widget _action() {
    return Row(
      children: [
        IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
        IconButton(icon: Icon(Icons.search), onPressed: () {
          Get.toNamed("/search");
        }),
        CircleAvatar( // 이미지를 Provider로 받아옴. 이미지 주소 복사 해서 붙여넣음
          backgroundColor: Colors.grey.withOpacity(0.5),
          backgroundImage: Image.network("https://dimg.donga.com/wps/NEWS/IMAGE/2021/01/17/104953245.2.jpg").image,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // logo, action 그룹으로 나눠서 정렬해줌.
        children: [
          _logo(),
          _action(),
        ],
      ),
    );
  }
}
