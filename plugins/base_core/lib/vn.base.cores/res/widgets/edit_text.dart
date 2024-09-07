import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';
import '../font/fonts.dart';

String? txtSearch, txtChange;

class EditText extends StatefulWidget {
  final String? font;
  final Color? color;
  final double? fontSize;
  final double? radius;
  final Color? bg;
  final Color? shadow;
  final double? height;
  final String? hint;
  final TextInputType? type;
  final bool? isPass;
  final TextEditingController? txtController;
  final FocusNode? focusNode;
  final TextAlign? align;
  final int? length;
  final int? lines;
  final Color? hintColor;
  final Color? cursorColor;
  final bool? enable;
  final void Function(String)? callback;

  const EditText({
    Key? key,
    this.txtController,
    this.hintColor,
    this.radius,
    this.focusNode,
    this.length,
    this.font,
    this.color,
    this.fontSize,
    this.bg,
    this.shadow,
    this.height,
    this.hint,
    this.type,
    this.isPass,
    this.align,
    this.cursorColor,
    this.enable,
    this.lines,
    this.callback,
  }) : super(key: key);

  @override
  _ItemEditState createState() => _ItemEditState();
}

class _ItemEditState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 0)), color: widget.bg),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        style: TextStyle(fontFamily: widget.font ?? FontApp.light, color: widget.color, fontSize: widget.fontSize),
        enabled: widget.enable ?? true,
        focusNode: widget.focusNode,
        controller: widget.txtController,
        textAlign: widget.align ?? TextAlign.center,
        obscureText: widget.isPass ?? false,
        maxLines: (widget.isPass ?? false) ? 1 : null,
        keyboardType: widget.type ?? TextInputType.text,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        cursorColor: widget.cursorColor ?? ColorItem.colorGrayLight,
        cursorWidth: 2,
        onChanged: (txt) {
          if (txt.isEmpty == true) {
            return;
          }
          if (txtChange == null) {
            txtChange = txt;
            onChanged();
          }
          txtChange = widget.txtController?.text.toString();
        },
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(color: widget.hintColor, fontFamily: widget.font ?? FontApp.light),
          border: InputBorder.none,
          counterText: '',
          isDense: true,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  void onChanged() {
    if (txtSearch == null) {
      txtSearch = txtChange;
      Future.delayed(const Duration(milliseconds: 500), () {
        if (txtSearch != widget.txtController?.text) {
          txtSearch = null;
          onChanged();
          return;
        }
        if (widget.callback != null) {
          widget.callback!(widget.txtController?.text ?? 'NULL');
        }
        txtChange = null;
        txtSearch = null;
        return;
      });
    }
  }
}
