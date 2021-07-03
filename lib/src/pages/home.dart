import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtubegetxpro/src/Controller/homeController.dart';
import 'package:youtubegetxpro/src/components/CustomAppBar.dart';
import 'package:youtubegetxpro/src/components/video_widget.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => CustomScrollView(
            controller: controller.scrollController,
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
                    child: VideoWidget(video : controller.youtubeResult.value.items![index]));
              },
                  childCount:
                      controller.youtubeResult.value.items == null ? 0
                          : controller.youtubeResult.value.items!.length),
            )
          ],
        ),
      ),
    );
  }
}
