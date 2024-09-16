// ignore_for_file: depend_on_referenced_packages

import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:base_core/vn.base.cores/utils/utils.dart';
import 'package:ebook/vn.app.common/presenter/view/splash/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/item_library.dart';
import '../../widgets/title_appbar.dart';
import 'library.dart';

class LibraryScreen {
  final Library main;
  final BuildContext context;

  LibraryScreen(this.main, this.context);

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
      child: Container(
        width: ds.width,
        height: ds.height,
        padding: EdgeInsets.symmetric(horizontal: ds.horizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap40,
            const TitleAppBarBig(title: 'Thư viện'),
            Gaps.vGap15,
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.dp,
                  crossAxisSpacing: 10.dp,
                  mainAxisExtent: 450.dp,
                ),
                itemCount: main.vm.library.length,
                itemBuilder: (context, index) {
                  final library = main.vm.library[index];
                  return ItemLibrary(
                    color: ColorExtends(library.color),
                    title: library.name,
                    logo: Image.asset(
                      library.image,
                      width: 500.dp,
                      height: 500.dp,
                      fit: BoxFit.fill,
                    ),
                    callback: (v) {
                      main.choseLibrary(library.id);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
