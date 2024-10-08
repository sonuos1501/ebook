import 'package:base_core/vn.base.cores/common/constant.dart';
import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:flutter/material.dart';

class TitleTextBook extends StatelessWidget {
  const TitleTextBook({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textSize20.copyWith(
        fontFamily: fontBold,
        color: Colours.black,
      ),
    );
  }
}
