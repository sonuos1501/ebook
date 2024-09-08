// ignore_for_file: depend_on_referenced_packages

import 'package:ebook/routers.dart';
import 'package:ebook/vn.app.common/presenter/view/splash/splash.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routers.root,
      page: () => const SplashState(),
      transition: Transition.leftToRight,
    ),
  ];
}
