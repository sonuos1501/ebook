import 'package:base_core/vn.base.cores/common/constant.dart';
import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:base_core/vn.base.cores/res/widgets/blink_item.dart';
import 'package:flutter/material.dart';

class ItemLibrary extends StatelessWidget {
  const ItemLibrary({
    super.key,
    required this.color,
    required this.title,
    required this.logo,
    required this.callback,
  });

  final Widget logo;
  final String title;
  final Color color;
  final Function(Widget) callback;

  @override
  Widget build(BuildContext context) {
    return BlinkItem(
      callback: callback,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.dp, vertical: 20.dp),
        decoration: BoxDecoration(
          color: color.withOpacity(.1),
          borderRadius: BorderRadius.circular(10.dp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
            Expanded(child: Center(child: logo)),
          ],
        ),
      ),
    );
  }

  Text _title() {
    return Text(
      title,
      style: textSize20.copyWith(
        fontFamily: fontBold,
        color: color,
      ),
    );
  }
}
