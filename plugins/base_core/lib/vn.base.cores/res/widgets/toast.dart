import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../resources.dart';

BoxDecoration _decoration = BoxDecoration(
  color: Colours.c4C000000,
  border: Border.all(color: Colours.c2FE3EB),
  borderRadius: BorderRadius.circular(12.dp),
);

void showFToast({
  required BuildContext context,
  required String content,
  Color color = Colours.cFFD601,
  BoxDecoration? decoration,
  double? width,
  double? height,
}) {
  showToastWidget(
    Wrap(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          Container(
            padding: EdgeInsets.all(9.dp),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colours.c9A1B1C21,
              borderRadius: BorderRadius.all(
                Radius.circular(10.dp),
              ),
              border: Border.fromBorderSide(
                BorderSide(color: Colours.c2FE3EB, width: 1),
              ),
            ),
            child: Text(
              content,
              style: textSize16.copyWith(
                color: Colours.cFFD601,
              ),
            ),
          ),
        ]),
      ])
    ]),
    context: context,
    animation: StyledToastAnimation.fade,
    position: StyledToastPosition.center,
    duration: Duration(seconds: 2),
  );
}

void showToastFromPosition({
  required BuildContext context,
  required String content,
  Color color = Colours.cFFD601,
  BoxDecoration? decoration,
  double? width,
  double? height,
  double? position,
}) {
  _CFToast _toast = _CFToast();
  _toast.init(context);
  _toast.showToast(
    position: position,
    child: Container(
      width: width ?? 145.dp,
      height: height ?? 40.dp,
      decoration: decoration ?? _decoration,
      alignment: Alignment.center,
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: textSize16.copyWith(
          color: color,
          fontWeight: regular,
        ),
      ),
    ),
  );
}

class _CFToast {
  BuildContext? context;

  static final _CFToast _instance = _CFToast._internal();

  /// Prmary Constructor for FToast
  factory _CFToast() {
    return _instance;
  }

  _CFToast init(BuildContext context) {
    _instance.context = context;
    return _instance;
  }

  _CFToast._internal();

  OverlayEntry? _entry;
  List<_ToastEntry> _overlayQueue = [];
  Timer? _timer;

  _showOverlay() {
    if (_overlayQueue.length == 0) {
      _entry = null;
      return;
    }
    _ToastEntry _toastEntry = _overlayQueue.removeAt(0);
    _entry = _toastEntry.entry;
    if (context == null)
      throw ('Error: Context is null, Please call init(context) before showing toast.');
    Overlay.of(context!).insert(_entry!);

    _timer = Timer(_toastEntry.duration!, () {
      Future.delayed(Duration(milliseconds: 360), () {
        removeCustomToast();
      });
    });
  }

  removeCustomToast() {
    _timer?.cancel();
    _timer = null;
    if (_entry != null) _entry!.remove();
    _entry = null;
    _showOverlay();
  }

  removeQueuedCustomToasts() {
    _timer?.cancel();
    _timer = null;
    _overlayQueue.clear();
    if (_entry != null) _entry!.remove();
    _entry = null;
  }

  void showToast({
    required Widget child,
    Duration? toastDuration,
    int fadeDuration = 350,
    double? position,
  }) {
    if (context == null)
      throw ('Error: Context is null, Please call init(context) before showing toast.');
    Widget newChild = _ToastStateFul(
      child,
      toastDuration ?? Duration(seconds: 2),
      fadeDuration: fadeDuration,
    );

    OverlayEntry newEntry = OverlayEntry(builder: (context) {
      return _getPostionWidgetBasedOnGravity(newChild, position);
    });

    _overlayQueue.add(_ToastEntry(
      entry: newEntry,
      duration: toastDuration ?? Duration(seconds: 2),
    ));
    if (_timer == null) _showOverlay();
  }

  _getPostionWidgetBasedOnGravity(
    Widget child,
    double? position,
  ) {
    return Positioned(
      top: 50.0.dp,
      bottom: position ?? 24.0.dp,
      left: 24.0.dp,
      right: 24.0.dp,
      child: child,
    );
  }
}

class _ToastEntry {
  final OverlayEntry? entry;
  final Duration? duration;

  _ToastEntry({this.entry, this.duration});
}

class _ToastStateFul extends StatefulWidget {
  _ToastStateFul(this.child, this.duration, {Key? key, this.fadeDuration = 350})
      : super(key: key);

  final Widget child;
  final Duration duration;
  final int fadeDuration;

  @override
  ToastStateFulState createState() => ToastStateFulState();
}

/// State for [_ToastStateFul]
class ToastStateFulState extends State<_ToastStateFul>
    with SingleTickerProviderStateMixin {
  /// Start the showing animations for the toast
  showIt() {
    _animationController!.forward();
  }

  /// Start the hidding animations for the toast
  hideIt() {
    _animationController!.reverse();
    _timer?.cancel();
  }

  /// Controller to start and hide the animation
  AnimationController? _animationController;
  late Animation _fadeAnimation;

  Timer? _timer;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.fadeDuration),
    );
    _fadeAnimation =
        CurvedAnimation(parent: _animationController!, curve: Curves.easeIn);
    super.initState();

    showIt();
    _timer = Timer(widget.duration, () {
      hideIt();
    });
  }

  @override
  void deactivate() {
    _timer?.cancel();
    _animationController!.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation as Animation<double>,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: widget.child,
        ),
      ),
    );
  }
}
