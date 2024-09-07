import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:flutter/material.dart';

import 'blink_item.dart';
import 'commons.dart';
import 'load_image.dart';

class ErrorFWidget extends StatelessWidget {
  final String mainImage;
  final String descScript;
  final double? height;
  final String button;
  final Color txtDestColor;
  final VoidCallback? onPressed;
  final bool? showBack;
  final bool? showReloadBack;

  const ErrorFWidget({
    super.key,
    required this.mainImage,
    this.height,
    required this.descScript,
    required this.button,
    this.onPressed,
    this.showBack,
    this.txtDestColor = Colours.white,
    this.showReloadBack,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadImage(
                  mainImage,
                  height: 60.dp,
                ),
                Gaps.vGap10,
                Text(
                  descScript,
                  style: textSize16.copyWith(
                    color: txtDestColor,
                    fontWeight: regular,
                  ),
                ),
                Gaps.vGap20,
                Visibility(
                  visible: showReloadBack ?? false,
                  child: BlinkItem(
                    noBlink: true,
                    callback: (Widget) {
                      if (null != onPressed) {
                        onPressed?.call();
                      }
                    },
                    child: SizedBox(
                      child: LoadImage(
                        button,
                        width: 100.dp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10 + ds.statusBarHeight,
            left: 0,
            child: Visibility(
              visible: showBack ?? false,
              child: backIcon(context),
            ),
          ),
        ],
      ),
    );
  }
}
