import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:flutter/material.dart';

import '../../../r_base.dart';

import 'load_image.dart';

class Loading extends StatefulWidget {
  final String text;
  final String? loadingImage;
  const Loading({
    super.key,
    required this.text,
    this.loadingImage,
  });
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadImage(
              widget.loadingImage ?? RBase.loading,
              width: 50.dp,
            ),
            Gaps.vGap4,
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                double value = _animation.value;
                Gradient gradient = LinearGradient(
                  colors: const [
                    Colours.c2FE3EB,
                    Colours.cFFD601,
                    Colours.c2FE3EB
                  ],
                  stops: [value - 0.2, value, value + 0.2],
                );
                Shader shader = gradient.createShader(
                  Rect.fromLTWH(0, 0, size.width, size.height),
                );
                return Text(
                  widget.text,
                  style: textSize12.copyWith(
                    fontWeight: semiBold,
                    foreground: Paint()..shader = shader,
                    decoration: TextDecoration.none,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
