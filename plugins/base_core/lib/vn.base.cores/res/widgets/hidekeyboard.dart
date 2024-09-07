import 'package:flutter/cupertino.dart';

class HideKeyboard extends GestureDetector {
  HideKeyboard({
    required BuildContext context,
    required Widget child,
    VoidCallback? onClicked,
  }) : super(
          child: child,
          onTap: () {
            if (onClicked != null) {
              onClicked();
            } else {
              FocusScope.of(context).requestFocus(FocusNode());
            }
          },
        );
}
