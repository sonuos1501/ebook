// ignore_for_file: depend_on_referenced_packages

import 'package:ebook/routers.dart';
import 'package:ebook/vn.app.common/presenter/view/splash/splash.dart';
import 'package:ebook/vn.app.ebook/presenter/view/ebook_host/ebook_host.dart';
import 'package:ebook/vn.app.ebook/presenter/view/select_account/select_account.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routers.root,
      page: () => const SplashState(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routers.selectAccount,
      page: () => const SelectAccountState(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routers.library,
      page: () => const EbookHostState(),
      transition: Transition.leftToRight,
      parameters: const {'screenName': Routers.library},
    ),
    GetPage(
      name: Routers.textBook,
      page: () => const EbookHostState(),
      transition: Transition.leftToRight,
      parameters: const {'screenName': Routers.textBook},
    ),
  ];
}
