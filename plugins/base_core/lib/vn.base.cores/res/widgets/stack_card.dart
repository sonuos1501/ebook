import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StackCard extends StatefulWidget {
  final Function(Object) onChild;
  final List<Object> listData;
  final void Function(bool) callback;
  final Widget emptyData;

  const StackCard({
    super.key,
    required this.onChild,
    required this.listData,
    required this.callback,
    required this.emptyData,
  });

  @override
  _StackCardState createState() => _StackCardState();
}

class _StackCardState extends State<StackCard> {
  RxInt index = 0.obs;
  RxDouble top = 0.0.obs;
  RxDouble left = 0.0.obs;
  RxBool isDragged = false.obs;
  RxBool isReset = false.obs;
  RxInt animatedDuration = 220.obs;
  RxDouble boundLimit = 0.0.obs;

  _StackCardState();

  @override
  Widget build(BuildContext context) {
    return _cardStack();
  }

  //card stack
  Widget _cardStack() {
    return widget.listData.isEmpty
        ? emptyData()
        : Container(
            margin: EdgeInsets.only(left: 16.dp, right: 30.dp),
            height: 200.dp,
            clipBehavior: Clip.none,
            child: _cards(),
          );
  }

  Widget _cards() {
    return Obx(() => Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: _initListChildren(),
        ));
  }

  Widget emptyData() {
    return widget.emptyData;
  }

  void updateValue(double dy, double dx) {
    boundLimit.value += dy;
    isDragged.value = true;
    isReset.value = false;
    left.value += dx;
    if (boundLimit > 30.0.dp || boundLimit < -10.0.dp) {
      return;
    } else {
      top.value += dy;
    }
  }

  void resetPosition(double screenWidth) async {
    boundLimit.value = 0.0;
    if (left.value > 40.0.dp) {
      left.value = screenWidth;
      setImageIndex();
    } else if (left.value < -40.0.dp) {
      left.value = -screenWidth;
      setImageIndex();
    } else {
      top.value = 0;
      left.value = 0;
      isReset.value = true;
      isDragged.value = false;
    }
  }

  void setImageIndex() async {
    Object item = widget.listData.first;
    await Future.delayed(Duration(milliseconds: animatedDuration.value));
    widget.listData.removeAt(0);
    widget.listData.add(item);
    resetFirstItemPos();
    isDragged.value = false;
  }

  void resetFirstItemPos() {
    isReset.value = true;
    top.value = 0;
    left.value = 0;
  }

  _initListChildren() {
    final List<Widget> listChildren = [];
    final itemLimit = widget.listData.length > 3 ? 3 : widget.listData.length;
    for (int index = 0; index < itemLimit; index++) {
      final item = widget.listData[index];
      listChildren.add(index == 0
          ? AnimatedPositioned(
              duration: Duration(
                  milliseconds: isReset.value ? 0 : animatedDuration.value),
              top: top.value,
              left: left.value,
              child: Listener(
                onPointerDown: (_) {
                  widget.callback.call(false);
                },
                // nếu người dùng touch vào stack mà ko kéo thì set lại scroll gesture cho các widget khác
                onPointerUp: (_) {
                  if (!isDragged.value) {
                    widget.callback.call(true);
                  }
                },
                child: GestureDetector(
                  onPanUpdate: (e) {
                    updateValue(e.delta.dy, e.delta.dx);
                  },
                  onPanEnd: (e) {
                    widget.callback.call(true);
                    resetPosition(MediaQuery.of(context).size.width);
                  },
                  child: widget.onChild(item),
                ),
              ))
          : Positioned(
              top: (index * 11).dp,
              left: (index * 11).dp,
              child: Listener(
                onPointerDown: (_) {
                  widget.callback.call(true);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.dp),
                  child: AnimatedContainer(
                    width: 382.dp,
                    height: 192.dp,
                    color: const Color(0xFF9B8BFF)
                        .withOpacity((1 / (index + 0.2))),
                    duration: Duration(
                        milliseconds:
                            isReset.value ? 0 : animatedDuration.value),
                    child: AnimatedOpacity(
                      opacity: isDragged.value && index == 1 ? 1 : 0,
                      duration: Duration(
                          milliseconds:
                              isReset.value ? 0 : animatedDuration.value),
                      child: widget.onChild(item),
                    ),
                  ),
                ),
              ),
            ));
    }

    return listChildren.reversed.toList();
  }
}
