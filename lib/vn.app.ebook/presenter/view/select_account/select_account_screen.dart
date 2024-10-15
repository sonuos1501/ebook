// ignore_for_file: depend_on_referenced_packages
import 'package:base_core/vn.base.cores/common/constant.dart';
import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:base_core/vn.base.cores/res/widgets/blink_item.dart';
import 'package:base_https/vn.base.https/domain/model/ParrentProfileEntity.dart';
import 'package:ebook/r.dart';
import 'package:ebook/vn.app.ebook/presenter/view/select_account/select_account.dart';
import 'package:ebook/vn.app.ebook/presenter/view/select_account/select_account_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectAccountScreen {
  final SelectAccount main;
  final BuildContext context;

  SelectAccountScreen(this.main, this.context);

  Widget screen() {
    return GetBuilder<SelectAccountViewModel>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: mainBody(),
      );
    });
  }

  Widget mainBody() {
    return Container(
      alignment: Alignment.topLeft,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(R.loginImgSelectStudentAccBackground),
          ).marginOnly(top: 45.dp),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 24.dp,
              runSpacing: 16.dp,
              children: _getStudentAccountCards(
                accounts: main.vm.users,
                onAccountSelected: (id) {
                  main.onAccountSelected(id);
                },
              ),
            ).marginSymmetric(
              horizontal: MediaQuery.of(context).size.width * 0.18,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getStudentAccountCards({
    required List<ChildrenEntity> accounts,
    required Function(String) onAccountSelected,
  }) {
    List<Widget> result = [];

    for (var element in accounts) {
      result.add(
        BlinkItem(
            child: Container(
              width: 240.dp,
              height: 256.dp,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(20.dp)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 40.dp, horizontal: 32.dp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60.dp,
                    //Todo was 96px on figma, need to check if dp conversion is incorrect
                    backgroundColor: Colors.transparent,
                    foregroundImage: AssetImage(element.avatar ?? ''),
                  ),
                  Gaps.vGap16,
                  Text(
                    element.name ?? '',
                    style: textSize21.copyWith(
                      color: const Color(0xFF242424),
                      fontFamily: fontMedium,
                    ),
                  ),
                ],
              ),
            ),
            callback: (v) {
              onAccountSelected(element.id);
            }),
      );
    }

    return result;
  }
}
