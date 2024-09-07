import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:flutter/material.dart';

//base - 05/04/2022
var stateChange = false;
var index = 0;

class ZoomItem extends StatefulWidget {
  final Widget child;
  final double? w, h;
  final index;
  final bool? isAnimated;

  const ZoomItem({
    super.key,
    required this.index,
    required this.child,
    this.w,
    this.h,
    this.isAnimated,
  });

  get state => _ZoomItemState();

  @override
  _ZoomItemState createState() => state;
}

class _ZoomItemState extends State<ZoomItem>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
      lowerBound: 0,
      upperBound: 0.5,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _ZoomItemState();

  ZoomItem() {
    setState(() {
      _controller.forward();
      setState(() {
        Future.delayed(const Duration(milliseconds: 100), () {
          _controller.reverse();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    animate();
    return Transform.scale(
      scale: _scale,
      child: _animatedButton(),
    );
  }

  Widget _animatedButton() {
    return Container(
      padding: EdgeInsets.only(top: 2.dp),
      child: generateChild(),
    );
  }

  generateChild() {
    if (widget.w != null && widget.h != null) {
      return SizedBox(
        // width: widget.w,
        // height: widget.h,
        child: widget.child,
      );
    }
    if (widget.w != null) {
      return SizedBox(
        // width: widget.w,
        child: widget.child,
      );
    }
    if (widget.h != null) {
      return SizedBox(
        // height: widget.h,
        child: widget.child,
      );
    }
    return widget.child;
  }

  animate() {
    if (stateChange && widget.index == index) {
      stateChange = false;
      Future.delayed(const Duration(milliseconds: 100), () {
        ZoomItem();
      });
    }
  }
}
