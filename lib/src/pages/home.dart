import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtubegetxpro/src/components/CustomAppBar.dart';
import 'package:youtubegetxpro/src/components/video_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: CustomAppBar(), // 앱바를 별도로 구성.
            floating: true, // 스크롤에 따라 AppBar를 다시 나오도록 만듬
            snap: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return GestureDetector(
                  onTap: () {
                    //page route
                    Get.toNamed("/detail/239587");
                  },
                  child: VideoWidget());
            }, childCount: 10),
          )
        ],
      ),
    );
  }
}
