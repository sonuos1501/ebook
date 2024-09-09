import 'package:base_core/vn.base.cores/common/constant.dart';
import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:base_core/vn.base.cores/res/widgets/blink_item.dart';
import 'package:base_core/vn.base.cores/res/widgets/load_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemUser extends StatelessWidget {
  const ItemUser({
    super.key,
    this.avatar,
    required this.name,
    required this.callback,
  });

  final String? avatar;
  final String name;
  final Function(Widget) callback;

  @override
  Widget build(BuildContext context) {
    final size = 310.dp;
    return BlinkItem(
      callback: callback,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.dp),
        ),
        height: size + 10,
        width: size,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.dp),
                  child: LoadImage(
                    avatar ?? '',
                  ),
                ),
              ),
            ),
            Gaps.vGap10,
            _name(context),
          ],
        ),
      ),
    );
  }

  Text _name(BuildContext context) {
    return Text(
      name,
      style: textSize30.copyWith(
        fontFamily: fontBold,
        color: const Color(0xFF242424),
      ),
    );
  }
}
