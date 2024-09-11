// ignore_for_file: depend_on_referenced_packages

import 'package:ebook/vn.app.common/presenter/view/splash/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'text_book.dart';

class TextBookScreen {
  final TextBook main;
  final BuildContext context;

  TextBookScreen(this.main, this.context);

  Widget screen() {
    return GetBuilder<SplashViewModel>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: mainBody(),
      );
    });
  }

  Widget mainBody() {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Column(
          children: [
            Expanded(child: Placeholder()),
          ],
        ),
      ),
    );
  }
}
