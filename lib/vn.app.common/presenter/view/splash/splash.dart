import 'package:ebook/vn.app.common/presenter/view/base_view.dart';
import 'package:ebook/vn.app.common/presenter/view/splash/splash_screen.dart';
import 'package:ebook/vn.app.common/presenter/view/splash/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum StatusUpdate { idle, started, installing, completed }

class SplashState extends StatefulWidget {
  const SplashState({super.key});

  @override
  Splash createState() => Splash();
}

class Splash extends BaseScreen<SplashState, SplashViewModel> {
  @override
  void initViewModel() {
    Get.lazyPut(() => SplashViewModel());
  }

  @override
  Widget initWidget(BuildContext context, double topHeight) {
    return SplashScreen(this, context).screen();
  }
}
