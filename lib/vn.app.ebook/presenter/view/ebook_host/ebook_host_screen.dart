// ignore_for_file: depend_on_referenced_packages

import 'package:ebook/vn.app.common/presenter/view/splash/splash_vm.dart';
import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../vn.app.common/presenter/widgets/build_tab.dart';
import 'ebook_host.dart';

class EbookHostScreen {
  final EbookHost main;
  final BuildContext context;

  EbookHostScreen(this.main, this.context);

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
        child: Column(
          children: [
            Expanded(child: _host()),
            _tabs(),
          ],
        ),
      ),
    );
  }

  Widget _host() {
    return main.getCurrentPage();
  }

  Widget _tabs() {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(17.dp),
          topRight: Radius.circular(17.dp),
        ),
        color: Colours.greyDart[300],
      ),
      child: Row(
        children: main.listTab.map((e) {
          return Expanded(
            child: BuildTab(
              index: e.index,
              title: e.title ?? '',
              selectedIndex: main.selectedIndex,
              selectedTab: (selectedIndex) async {
                main.onItemSelected(selectedIndex);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
