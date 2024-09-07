import 'package:base_core/r_base.dart';
import 'package:flutter/material.dart';

import '../resources.dart';
import 'errorwidget.dart';
import 'loading.dart';

enum _ShowError {
  network,
  errorWidget,
  loading,
  content,
}

Widget getEmptyView({
  required Checked checked,
  required VoidCallback back,
  required Widget Function() builder,
  double? height,
  String errorMsg = 'Lỗi hệ thống',
  String butMsg = 'Đang tải dữ liệu',
  String image = RBase.icEmpty,
  Color bgColor = Colours.main,
  Color txtDestColor = Colours.white,
  String butImage = RBase.btTry,
  Widget Function()? builderSkeleton,
  bool showBack = false,
  bool showReloadBack = true,
}) {
  return Container(
    color: bgColor,
    child: _getContent(
      checked,
      height,
      butImage,
      showBack,
      showReloadBack,
      back,
      image,
      errorMsg,
      txtDestColor,
      builder,
    ),
  );
}

_getContent(checked, height, butImage, showBack, showReloadBack, back, image,
    errorMsg, txtDestColor, builder) {
  if (checked.errorType == _ShowError.network) {
    return ErrorFWidget(
      height: height,
      mainImage: RBase.icEmpty,
      descScript: errorMsg,
      button: butImage,
      showBack: showBack,
      txtDestColor: txtDestColor,
      showReloadBack: showReloadBack,
      onPressed: () {
        back.call();
      },
    );
  } else if (checked.errorType == _ShowError.loading) {
    return const Loading(text: 'Đang tải dữ liệu');
  } else if (checked.errorType == _ShowError.errorWidget) {
    return ErrorFWidget(
      mainImage: image,
      height: height,
      descScript: errorMsg,
      button: butImage,
      showBack: showBack,
      showReloadBack: showReloadBack,
      onPressed: () {
        back.call();
      },
    );
  } else {
    return builder();
  }
}

class Checked {
  late _ShowError errorType;

  Checked({
    bool loading = false,
    bool errorWidget = false,
    bool network = false,
  }) {
    if (loading) {
      errorType = _ShowError.loading;
    } else if (errorWidget) {
      errorType = _ShowError.errorWidget;
    } else if (network) {
      errorType = _ShowError.network;
    } else {
      errorType = _ShowError.content;
    }
  }
}
