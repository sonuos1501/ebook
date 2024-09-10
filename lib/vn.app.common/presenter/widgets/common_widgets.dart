// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:base_core/vn.base.cores/common/constant.dart';
import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:base_core/vn.base.cores/res/widgets/blink_item.dart';
import 'package:base_core/vn.base.cores/res/widgets/load_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
//
// Widget _LabeledOutlinedTextField({
//   required String label,
//   TextStyle? labelStyle,
//   String? hintText,
//   String? prefixText,
//   bool obscureText = false,
//   String obscuringCharacter = '•',
//   String? imageAsset,
//   TextInputType? keyboardType = TextInputType.text,
//   VoidCallback? onSuffixIconPressed,
//   TextEditingController? controller,
//   TextStyle? inputTextStyle,
//   TextStyle? hintStyle,
//   TextStyle? prefixTextStyle,
//   TextCapitalization? textCapitalization,
//   bool enabledInput = true,
// }) {
//   RxBool _shouldShowPrefix = RxBool(false);
//   FocusNode _focusNode = FocusNode();
//   _focusNode.addListener(() {
//     _shouldShowPrefix.value = _focusNode.hasPrimaryFocus;
//     if (_focusNode.hasPrimaryFocus == false) {
//       _focusNode.dispose();
//     }
//   });
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         label,
//         style: labelStyle,
//       ),
//       Gaps.vGap4,
//       Container(
//         height: 48.dp,
//         child: Obx(() => TextField(
//               focusNode: _focusNode,
//               textCapitalization: textCapitalization == null
//                   ? TextCapitalization.none
//                   : textCapitalization,
//               enabled: enabledInput,
//               controller: controller,
//               obscureText: obscureText,
//               obscuringCharacter: obscuringCharacter,
//               decoration: InputDecoration(
//                 isDense: true,
//                 contentPadding: EdgeInsets.all(12.dp),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8.dp)),
//                   borderSide: BorderSide(width: 0.5.dp),
//                 ),
//                 hintText: _shouldShowPrefix.value ? '' : hintText,
//                 hintStyle: hintStyle,
//                 prefixText: _shouldShowPrefix.value ? prefixText : '',
//                 prefixStyle: prefixTextStyle,
//                 suffixIcon: _getIconSuffix(
//                     imageAsset: imageAsset,
//                     onSuffixIconPressed: onSuffixIconPressed),
//               ),
//               keyboardType: keyboardType,
//               style: inputTextStyle,
//             )),
//       ),
//     ],
//   );
// }

class LabeledOutlinedTextField extends StatefulWidget {
  final String label;
  final TextStyle? labelStyle;
  final String? hintText;
  final String? prefixText;
  final bool obscureText;
  final String obscuringCharacter;
  final String? imageAsset;
  final TextInputType? keyboardType;
  final VoidCallback? onSuffixIconPressed;
  final TextEditingController? controller;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final TextStyle? prefixTextStyle;
  final TextCapitalization? textCapitalization;
  final bool enabledInput;
  final bool keepPrefixWhenHavingValue;
  final int? maxLength;
  final bool isAllowSpaceCharacter;

  const LabeledOutlinedTextField({
    Key? key,
    required this.label,
    this.labelStyle,
    this.hintText,
    this.prefixText,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.imageAsset,
    this.keyboardType,
    this.onSuffixIconPressed,
    this.controller,
    this.inputTextStyle,
    this.hintStyle,
    this.prefixTextStyle,
    this.textCapitalization,
    this.enabledInput = true,
    this.keepPrefixWhenHavingValue = false,
    this.maxLength = null,
    this.isAllowSpaceCharacter = true,
  }) : super(key: key);

  @override
  State<LabeledOutlinedTextField> createState() =>
      _LabeledOutlinedTextFieldState();
}

class _LabeledOutlinedTextFieldState extends State<LabeledOutlinedTextField> {
  late FocusNode _focusNode;
  bool _shouldShowPrefix = false;
  List<TextInputFormatter> _inputFormatters = [];

  @override
  void initState() {
    super.initState();
    if (!widget.isAllowSpaceCharacter) {
      _inputFormatters.add(FilteringTextInputFormatter.deny(RegExp('[ ]')));
    }

    if (widget.maxLength != null) {
      _inputFormatters.add(LengthLimitingTextInputFormatter(widget.maxLength));
    }

    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (widget.keepPrefixWhenHavingValue == false) {
        _shouldShowPrefix = _focusNode.hasFocus;
        _removeFocus();
      } else {
        if (widget.controller != null && widget.controller!.text.isNotEmpty) {
          _shouldShowPrefix = true;
        } else {
          _shouldShowPrefix = _focusNode.hasFocus;
        }
        _removeFocus();
      }
    });
  }

  void _removeFocus() {
    if (_focusNode.hasPrimaryFocus == false) {
      // FocusScope.of(context).unfocus();
      // FocusManager.instance.primaryFocus?.unfocus();
      // FocusScope.of(context).focusedChild?.unfocus();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: widget.labelStyle,
        ),
        Gaps.vGap4,
        Container(
          height: 48.dp,
          child: TextField(
            inputFormatters: _inputFormatters,
            focusNode: _focusNode,
            textCapitalization: widget.textCapitalization == null
                ? TextCapitalization.none
                : widget.textCapitalization!,
            enabled: widget.enabledInput,
            controller: widget.controller,
            obscureText: widget.obscureText,
            obscuringCharacter: widget.obscuringCharacter,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(12.dp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.dp)),
                borderSide: BorderSide(width: 0.5.dp),
              ),
              hintText: _shouldShowPrefix ? '' : widget.hintText,
              hintStyle: widget.hintStyle,
              prefixText: _shouldShowPrefix ? widget.prefixText : '',
              prefixStyle: widget.prefixTextStyle,
              suffixIcon: _getIconSuffix(
                  imageAsset: widget.imageAsset,
                  onSuffixIconPressed: widget.onSuffixIconPressed),
            ),
            keyboardType: widget.keyboardType,
            style: widget.inputTextStyle,
          ),
        ),
      ],
    );
  }
}

Widget? _getIconSuffix({
  String? imageAsset,
  VoidCallback? onSuffixIconPressed,
}) {
  if (imageAsset == null) {
    return null;
  } else {
    return IconButton(
      icon: Image.asset(imageAsset),
      onPressed: () {
        if (onSuffixIconPressed != null) {
          onSuffixIconPressed();
        }
      },
    );
  }
}

/**
 * Custom button:
 *  - Button's width = wrap content by default
 */
Widget CustomOutlinedButton({
  required String text,
  TextStyle? textStyle,
  String? imagePrefixAsset,
  Color? imageColor,
  Color? outlinedColor,
  double? borderRadius,
  bool shouldWrapContent = true,
  required VoidCallback onButtonClicked,
}) {
  MainAxisSize rowMainAxisSize = MainAxisSize.min;

  if (!shouldWrapContent) {
    rowMainAxisSize = MainAxisSize.max;
  }

  return BlinkItem(
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(borderRadius == null ? 8.dp : borderRadius)),
          border: Border.all(
            color: outlinedColor == null ? Color(0xFF155EEF) : outlinedColor,
            width: 1.dp,
          ),
          color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.dp, vertical: 10.dp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: rowMainAxisSize,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _getButtonChildren([
            _getImagePrefix(
              imagePrefixAsset: imagePrefixAsset,
              imageColor: imageColor,
            ),
            Text(
              text,
              style: textStyle,
            ),
          ]),
        ),
      ),
    ),
    callback: (v) {
      onButtonClicked();
    },
  );
}

List<Widget> _getButtonChildren(List<Widget?> widgets) {
  List<Widget> children = [];
  widgets.forEach((element) {
    if (element != null) {
      children.add(element);
      if (widgets.indexOf(element) != widgets.indexOf(widgets.last)) {
        children.add(Gaps.hGap8);
      }
    }
  });
  return children;
}

Image? _getImagePrefix(
    {String? imagePrefixAsset, Color? imageColor = Colors.white}) {
  if (imagePrefixAsset == null) {
    return null;
  } else {
    return Image.asset(
      imagePrefixAsset,
      width: 24.dp,
      height: 24.dp,
      color: imageColor,
      colorBlendMode: BlendMode.overlay,
    );
  }
}

Widget LightTopAppBar({
  required String title,
  required String homeIconAsset,
  required Function onNavigateBackToHome,
}) {
  return Container(
    color: Colors.white,
    padding:
        EdgeInsets.only(left: 24.dp, top: 16.dp, right: 8.dp, bottom: 8.dp),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: textSize28.copyWith(
            color: Color(0xFF242424),
            fontFamily: fontMedium,
          ),
        ),
        BlinkItem(
          w: 48.dp,
          h: 48.dp,
          callback: (v) {
            onNavigateBackToHome();
          },
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(12.dp),
            child: LoadImage(
              homeIconAsset,
              width: 24.dp,
              height: 24.dp,
              color: Color(0xFF6E6E6E),
            ),
          ),
        ),
      ],
    ),
  );
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final Color enableColor;
  final Color disableColor;
  final double? width;
  final double? height;
  final double? switchHeight;
  final double? switchWidth;
  final ValueChanged<bool> onChanged;

  CustomSwitch(
      {Key? key,
      required this.value,
      required this.enableColor,
      required this.disableColor,
      this.width,
      this.height,
      this.switchHeight,
      this.switchWidth,
      required this.onChanged})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: widget.width ?? 48.0,
            height: widget.height ?? 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: !widget.value ? widget.disableColor : widget.enableColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 0.0, left: 0.0),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: widget.switchWidth ?? 20.0,
                  height: widget.switchHeight ?? 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget PrimaryButton(
    {required String title,
    double? width,
    required Function(Widget) callback,
    bool isEnable = true}) {
  return BlinkItem(
      noBlink: !isEnable,
      child: Container(
        padding: EdgeInsets.all(12.dp),
        width: width,
        decoration: BoxDecoration(
          color: Color(0xFF155EEF),
          border: Border.all(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12.dp),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: textSize16.copyWith(
                fontFamily: fontMedium,
                fontWeight: FontWeight.w500,
                color: Color(0xffffffff),
              ),
            )
          ],
        ),
      ),
      callback: isEnable ? callback : (w) {});
}

Widget SecondaryButton(
    {required String title,
    double? width,
    required Function(Widget) callback,
    bool isEnable = true}) {
  return BlinkItem(
      noBlink: !isEnable,
      child: Container(
        padding: EdgeInsets.all(12.dp),
        width: width,
        decoration: BoxDecoration(
          color: Color(0xFFffffff),
          border: Border.all(
            color: Color(0xffD2D2D2),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12.dp),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                textAlign: TextAlign.center,
                style: textSize16.copyWith(
                  fontFamily: fontMedium,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ))
          ],
        ),
      ),
      callback: isEnable ? callback : (w) {});
}

Widget AppTextField({
  required TextEditingController controller,
  bool enabled = true,
  String? placeholder,
  TextInputType? keyboardType,
  bool obscureText = false,
  bool readOnly = false,
  int? maxLength,
  bool isEnableEyeButton = false,
  String? eysIconShow,
  String? eyeIconHide,
  Function? toggleEyeButton,
  List<TextInputFormatter>? inputFormatters,
}) {
  var eyeIcon = obscureText ? eysIconShow : eyeIconHide;
  return Container(
    height: 48.dp,
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        TextField(
          enabled: enabled,
          obscureText: obscureText,
          maxLength: maxLength,
          readOnly: readOnly,
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          style: textSize16.copyWith(
            fontWeight: FontWeight.w700,
            color: Color(0xff242424),
          ),
          decoration: InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.only(
                left: 12.dp, top: 12.dp, bottom: 12.dp, right: 48.dp),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1.dp, color: Color(0xFFD2D2D2)),
              borderRadius: BorderRadius.all(Radius.circular(8.dp)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.dp, color: Color(0xFFD2D2D2)),
              borderRadius: BorderRadius.all(Radius.circular(8.dp)),
            ),
            hintText: placeholder,
            hintStyle: textSize16.copyWith(
              fontWeight: FontWeight.w400,
              color: Color(0xFF909090),
            ),
          ),
        ),
        Visibility(
            visible: isEnableEyeButton,
            child: Align(
              alignment: Alignment.centerRight,
              child: BlinkItem(
                child: LoadImage(eyeIcon ?? '', width: 24.dp, height: 24.dp),
                callback: (w) {
                  if (toggleEyeButton != null) {
                    toggleEyeButton();
                  }
                },
              ),
            ).paddingOnly(right: 12.dp)),
      ],
    ),
  );
}
