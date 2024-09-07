import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final String? font;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontStyle;
  final TextAlign? align;
  final TextDecoration? deco;

  const TextView(
    this.text, {
    Key? key,
    this.font,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.align,
    this.deco,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        decoration: deco,
        fontFamily: font,
        color: color,
        fontSize: fontSize,
        fontWeight: fontStyle,
      ),
    );
  }
}
