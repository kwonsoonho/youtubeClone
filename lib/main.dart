import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtubegetxpro/src/Controller/youtubeDetailController.dart';
import 'package:youtubegetxpro/src/Controller/youtubeSearchController.dart';
import 'package:youtubegetxpro/src/app.dart';
import 'package:youtubegetxpro/src/binding/init_binding.dart';
import 'package:youtubegetxpro/src/components/youtubeDetail.dart';
import 'package:youtubegetxpro/src/pages/search.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Youtube clone App",
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      initialBinding: InitBinding(),
      // getPages에다가 선언을 해줘도 되지만 Bottom은 전체에서 사용되기 때문에 initia에다가 선언한다.
      getPages: [
        GetPage(name: '/', page: () => App()),
        GetPage(
            name: '/detail/:videoID',
            page: () => YoutubeDetail(),
            binding: BindingsBuilder(() => Get.lazyPut<YoutubeDetailController>(() => YoutubeDetailController()))),
        GetPage(
            name: '/search',
            page: () => YoutubeSearch(),
            binding: BindingsBuilder(() => Get.lazyPut<YoutubeSearchController>(() => YoutubeSearchController())))
      ],
    );
  }
}
