// ignore_for_file: non_nullable_equals_parameter

import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:base_core/vn.base.cores/res/widgets/blink_item.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../r_base.dart';
import '../../common/constant.dart';
import 'load_image.dart';
import 'toast.dart';

Widget backIcon(
  BuildContext context, {
  VoidCallback? goBack,
  Color? color = Colors.white,
}) {
  return InkWell(
    splashColor: Colours.transparent,
    child: Padding(
      padding: EdgeInsets.only(left: 16.dp, top: 10.dp, bottom: 10.dp),
      child: LoadImage(
        RBase.iconReturn,
        width: 24.dp,
        height: 24.dp,
        color: color,
      ),
    ),
    onTap: () {
      if (goBack != null) {
        goBack();
      } else {
        Get.back();
      }
    },
  );
}

Widget baseBackButton(
  BuildContext context, {
  VoidCallback? goBack,
  Color? color = Colors.white,
  EdgeInsetsGeometry? padding,
  required String icon,
  required double size,
}) {
  return BlinkItem(
    callback: (_) {
      if (goBack != null) {
        goBack();
      } else {
        Get.back();
      }
    },
    child: LoadImage(
      icon,
      width: size,
      height: size,
      fit: BoxFit.cover,
    ),
  );
}

List<TextInputFormatter> phoneLimit = [
  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
  LengthLimitingTextInputFormatter(11),
];

List<TextInputFormatter> verifiCode = [
  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
  LengthLimitingTextInputFormatter(4),
];

List<TextInputFormatter> pwdVerifi = [
  FilteringTextInputFormatter.allow(
    RegExp('[0-9A-Za-z!@#\$%^&*]'),
  ),
  LengthLimitingTextInputFormatter(11),
];

toastNetworkError(context) {
  toastWithBorder(
    'Không có kết nối mạng, vui lòng thử lại sau',
    context,
    textShadow: [
      BoxShadow(
        color: Colours.c00000080,
        offset: const Offset(0, 1),
        blurRadius: 2.dp,
      ),
    ],
    bgColor: Colours.c80000000,
    textColor: Colours.cFF4B5C,
    borderColor: Colours.cFF4B5C,
  );
}

void toastWithBorder(msg, BuildContext context,
    {pos, textShadow, bgColor, borderColor, textColor, x, y, time}) {
  showToastWidget(
    Wrap(children: [
      SizedBox(
        width: (x == null || x > 0) ? 0 : -x * 1.0,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Gaps.hGap10,
        Column(
          children: [
            SizedBox(
              height: (y == null || y > 0) ? 0 : -y * 1.0,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: bgColor ?? const Color(0xFF155EEF),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.fromBorderSide(
                  BorderSide(
                      color: borderColor ?? const Color(0xFF4986FF), width: 1),
                ),
              ),
              child: Text(
                msg,
                textAlign: TextAlign.center,
                maxLines: null,
                style: textSize20.copyWith(
                  color: textColor ?? Colours.white,
                  fontFamily: fontBold,
                  shadows: textShadow,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: (x == null || x < 0) ? 0 : x * 1.0,
        ),
        Gaps.hGap10,
      ])
    ]),
    context: context,
    animation: StyledToastAnimation.fade,
    position: pos ?? StyledToastPosition.center,
    duration: Duration(seconds: time ?? 2),
  );
}

void toastWithLeadingIcon(leadingIcon, msg, BuildContext context,
    {pos, textShadow, bgColor, borderColor, textColor, x, y, time}) {
  showToastWidget(
    Wrap(children: [
      SizedBox(
        width: (x == null || x > 0) ? 0 : -x * 1.0,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Gaps.hGap10,
        Column(
          children: [
            SizedBox(
              height: (y == null || y > 0) ? 0 : -y * 1.0,
            ),
            Container(
                padding: EdgeInsets.all(12.dp),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: bgColor ?? const Color(0xFF242424),
                  borderRadius: BorderRadius.all(
                    Radius.circular(120.dp),
                  ),
                  border: Border.fromBorderSide(
                    BorderSide(
                        color: borderColor ?? const Color(0xFF242424),
                        width: 1),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (leadingIcon != null)
                      SizedBox(
                        width: 24.dp,
                        height: 24.dp,
                        child: LoadImage(leadingIcon),
                      ),
                    Gaps.hGap8,
                    Text(
                      msg,
                      textAlign: TextAlign.center,
                      maxLines: null,
                      style: textSize16.copyWith(
                        color: textColor ?? Colours.white,
                        fontFamily: fontRegular,
                        shadows: textShadow,
                      ),
                    ),
                  ],
                ))
          ],
        ),
        SizedBox(
          width: (x == null || x < 0) ? 0 : x * 1.0,
        ),
        Gaps.hGap10,
      ])
    ]),
    context: context,
    animation: StyledToastAnimation.fade,
    position: pos ?? StyledToastPosition.bottom,
    duration: Duration(seconds: time ?? 2),
  );
}

void baseToast(String icon, String msg, BuildContext context,
    {StyledToastPosition? pos,
    List<Shadow>? textShadow,
    Color? bgColor,
    Color? textColor,
    int? timeSecond,
    EdgeInsets? margin}) {
  showToastWidget(
    Wrap(children: [
      Container(
        margin: margin,
        padding: EdgeInsets.all(14.dp),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: bgColor ?? const Color(0xFF155EEF),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoadImage(icon, width: 20.dp, height: 20.dp),
            Gaps.hGap8,
            Flexible(
              child: Text(
                msg,
                style: textSize14.copyWith(
                  color: textColor ?? Colours.black,
                  shadows: textShadow,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    ]),
    context: context,
    animation: StyledToastAnimation.fade,
    position: pos ?? StyledToastPosition.top,
    duration: Duration(seconds: timeSecond ?? 2),
  );
}

class DialogRouter<T> extends PageRouteBuilder<T> {
  final Widget page;

  DialogRouter(this.page)
      : super(
          opaque: false,
          barrierColor: const Color(0x00000001),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            return child;
          },
        );
}

extension EDouble on double {
  double toRoundedDown(int fractionDigits) {
    String temp = toString();
    List<String> nums = temp.split('.');
    if (nums.length == 2) {
      String integer = nums[0];
      String floats = nums[1];
      if (floats.length >= fractionDigits) {
        floats = floats.substring(0, fractionDigits);
      }
      temp = '$integer.$floats';
    }
    return double.tryParse(temp) ?? 0;
  }

  String roundedDownString(int fractionDigits) {
    return toRoundedDown(fractionDigits).toStringAsFixed(fractionDigits);
  }
}

class Time {
  int hour = 0;
  int minute = 0;
  int second = 0;
  int _timespace = 0;

  Time(String time) {
    List<String> temp = time.split(':');
    hour = int.tryParse(temp[0]) ?? 0;
    if (temp.length >= 2) {
      minute = int.tryParse(temp[1]) ?? 0;
    }
    if (temp.length >= 3) {
      second = int.tryParse(temp[2]) ?? 0;
    }
    assert(hour < 24 || minute < 60 || second < 60, 'time error');
    _timespace = (hour * 60 * 60 + minute * 60 + second) * 1000;
  }

  @override
  int get hashCode => hour.hashCode ^ minute.hashCode ^ second.hashCode;

  @override
  bool operator ==(dynamic other) {
    assert(other is Time, '${other.runtimeType} is not Time type');
    return _timespace == other._timespace;
  }

  bool operator >(Time other) {
    return _timespace > other._timespace;
  }

  bool operator <(Time other) {
    return _timespace < other._timespace;
  }

  bool operator >=(Time other) {
    return _timespace >= other._timespace;
  }

  bool operator <=(Time other) {
    return _timespace <= other._timespace;
  }
}

String ms2string(int ms) {
  var duration = Duration(milliseconds: ms).toString();
  duration = duration.substring(0, duration.length - 7);
  var list = duration.split(':');
  if (list[0].length <= 1) {
    duration = '0$duration';
  }
  return duration;
}

// Future<dynamic> saveScreen(BuildContext context, GlobalKey key) async {
//   Map<Permission, PermissionStatus> statuses =
//       await [Permission.storage, Permission.camera].request();
//   if (!statuses.entries.first.value.isGranted) {
//     return showFToast(context: context, content: 'Not allow!!!');
//   }
//   RenderObject? boundary = key.currentContext?.findRenderObject();
//   if (boundary == null) {
//     showFToast(context: context, content: 'Nothing to saved');
//     return null;
//   }
//   Image image = await (boundary as RenderRepaintBoundary).toImage(
//     pixelRatio: window.devicePixelRatio,
//   );
//   ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
//   if (byteData != null) {
//     return await ImageGallerySaver.saveImage(
//       byteData.buffer.asUint8List(),
//       quality: 100,
//     );
//   } else {
//     return null;
//   }
// }

void copyData(msg, context) {
  Clipboard.setData(ClipboardData(text: msg));
  showFToast(
    context: context,
    content: '複製鏈接成功...',
  );
}

Future<bool> safeLaunch(String url) async {
  try {
    final link = !url.startsWith('https') && !url.startsWith('http')
        ? 'https://$url'
        : url;
    return await launchUrl(
      Uri.parse(link),
      mode: Platform.isAndroid
          ? LaunchMode.externalNonBrowserApplication
          : LaunchMode.platformDefault,
    );
  } catch (e) {
    log(e.toString());
    return false;
  }
}

void callPhone(String tel) {
  launchUrl(Uri.parse('tel://$tel'));
}

void baseBottomSheet({
  required Widget child,
  String? icon,
  String? backgroundImgTop = RBase.bgBottomSheet,
  Color barrierColor = const Color(0x80000000),
  Color background = Colors.transparent,
  double height = 300,
  ValueChanged<dynamic>? callBack,
}) {
  _bottomSheet(
      child: child,
      icon: icon,
      backgroundImgTop: backgroundImgTop,
      barrierColor: barrierColor,
      height: height,
      callBack: callBack);
}

void _bottomSheet({
  required Widget child,
  String? icon,
  Color barrierColor = const Color(0x80000000),
  Color background = Colors.transparent,
  String? backgroundImgTop,
  double height = 300,
  ValueChanged<dynamic>? callBack,
}) {
  Get.bottomSheet(
    Container(
      alignment: Alignment.bottomCenter,
      color: background,
      height: height,
      child: LayoutBuilder(builder: (context, constrain) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            if (backgroundImgTop != null)
              LoadImage(
                backgroundImgTop,
              ),
            if (icon != null)
              Positioned(
                top: backgroundImgTop == null ? 0 : 25.dp,
                child: LoadImage(
                  icon,
                  width: 40.dp,
                ),
              ),
            Container(
              margin: EdgeInsets.only(top: 100.dp),
              child: Container(
                  width: constrain.maxWidth,
                  height: constrain.maxHeight,
                  color: Colors.white,
                  child: child),
            )
          ],
        );
      }),
    ),
    barrierColor: barrierColor,
    isDismissible: true,
    isScrollControlled: true,
  ).then((value) {
    print('Value: $value');
    callBack?.call(value);
  });
}
