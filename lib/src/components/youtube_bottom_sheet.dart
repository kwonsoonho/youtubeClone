import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class YoutubeBottomSheet extends StatelessWidget {
  const YoutubeBottomSheet({Key? key}) : super(key: key);

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "만들기",
          style: TextStyle(fontSize: 16),
        ),
        IconButton(icon: Icon(Icons.close), onPressed: Get.back)
      ],
    );
  }

  Widget _itemButton(
      {required String icon, required String buttonName, required Null Function() onTap, required double size}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey.withOpacity(0.3)),
              child: Center(
                child: Container(
                  // padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    "assets/svg/icons/${icon}.svg",
                    width: size,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left : 10.0),
              child: Text(buttonName),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        height: 200,
        color: Colors.white,
        child: Column(
          children: [
            _header(),
            SizedBox(
              height: 10,
            ),
            _itemButton(
                icon: "upload",
                buttonName: "동영상 업로드",
                size: 17,
                onTap: () {
                  print("동영상 업로드");
                }),
            _itemButton(
                icon: "broadcast",
                buttonName: "실시간 스트리밍 시작",
                size: 23,
                onTap: () {
                  print("실시간 스트리밍 시작");
                }),
          ],
        ),
      ),
    );
  }
}
