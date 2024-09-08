// ignore_for_file: depend_on_referenced_packages

import 'package:ebook/r.dart';
import 'package:ebook/vn.app.common/presenter/view/splash/splash.dart';
import 'package:ebook/vn.app.common/presenter/view/splash/splash_vm.dart';
import 'package:base_core/vn.base.cores/common/constant.dart';
import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen {
  final Splash main;
  final BuildContext context;

  SplashScreen(this.main, this.context);

  Widget screen() {
    return GetBuilder<SplashViewModel>(builder: (controller) {
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            const Color(0xFF00359E).withOpacity(0.12),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.vGap24,
          Gaps.vGap48,
          Container(
            width: double.maxFinite,
            alignment: Alignment.center,
            child: Image.asset(
              R.loginImgCompanyLogo,
              width: 111.89938.dp,
              height: 64.dp,
            ),
          ),
          Gaps.vGap149,
          Container(
            width: double.maxFinite,
            alignment: Alignment.center,
            child: Image.asset(
              R.loginImgPreLoginDecoration,
              width: 564.dp,
              height: 316.dp,
            ),
          ),
          Gaps.vGap209,
          Container(
            padding: EdgeInsets.fromLTRB(64.dp, 0.dp, 0.dp, 0.dp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Chào mừng bạn',
                  style: textSize32.copyWith(
                    fontFamily: fontRegular,
                    color: const Color(0xFF00359E),
                  ),
                ),
                Gaps.vGap16,
                Text(
                  'Đến với Hệ thống \nSách điện tử kiến thức \nphổ thông',
                  style: textSize56.copyWith(
                    fontFamily: fontRegular,
                    color: const Color(0xFF00359E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
