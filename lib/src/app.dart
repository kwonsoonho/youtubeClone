import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtubegetxpro/src/Controller/app_controller.dart';
import 'package:youtubegetxpro/src/pages/explore.dart';
import 'package:youtubegetxpro/src/pages/home.dart';
import 'package:youtubegetxpro/src/pages/library.dart';
import 'package:youtubegetxpro/src/pages/subscribe.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  BottomNavigationBarItem bottomNavigationBarItem(String iconName, String lable) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/svg/icons/${iconName}_off.svg",
          width: 22,
        ),
        activeIcon: SvgPicture.asset(
          "assets/svg/icons/${iconName}_on.svg",
          width: 22,
        ),
        label: lable);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        // controller 에다가 enum을 통해 페이지를 선언해 주고 배열로 인덱스를 주면 연동 된다.
        switch (RoutName.values[controller.currentIndex.value]) {
          case RoutName.Home:
            return Home();
            break;
          case RoutName.Explore:
            return Explore();
            break;
          case RoutName.Subs:
            return Subscribe();
            break;
          case RoutName.Library:
            return Library();
            break;
          case RoutName.Add:
          //bottomSheet 구현
            break;
        }
        return Container();
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          //binding 선언 후 사용
          selectedItemColor: Colors.black,
          // showSelectedLabels: true,
          onTap: (index) {
            print(index);
            // AppController.to.changePageIndex(index);
            controller.changePageIndex(index);
          },
          items: [
            bottomNavigationBarItem("home", '홈'),
            bottomNavigationBarItem("compass", '탐색'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SvgPicture.asset(
                    "assets/svg/icons/plus.svg",
                    width: 40,
                  ),
                ),
                label: ""),
            bottomNavigationBarItem("subs", '구독'),
            bottomNavigationBarItem("library", '보관함'),
          ],
        ),
      ),
    );
  }
}
