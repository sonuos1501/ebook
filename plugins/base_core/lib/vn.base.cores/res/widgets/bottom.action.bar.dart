import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:flutter/material.dart';

Widget buildBottomActions({
  required TabController controller,
  required List<String> items,
  required onChild,
  double indicatorPadding = -1,
  double bottomPadding = 1,
  TextStyle? labelStyle,
  labelColors = const [Color(0xFF7C2E0E), Color(0xFFB3A8AA)],
  required ValueChanged<int> onIndexChanged,
}) {
  return Container(
    alignment: Alignment.center,
    child: TabBar(
      controller: controller,
      tabs: List.generate(
        items.length,
        (index) {
          return Tab(
              iconMargin: const EdgeInsets.only(bottom: 1.0),
              child: onChild(items[index], index));
        },
      ),
      labelStyle: labelStyle ?? textSize16,
      labelColor: labelColors[0],
      unselectedLabelColor: labelColors[1],
      indicator: CircleTabIndicator(
        borderSide: BorderSide(color: labelColors[0], width: 2.dp),
        insets: EdgeInsets.only(bottom: bottomPadding),
      ),
      onTap: onIndexChanged,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: EdgeInsets.symmetric(
          horizontal: indicatorPadding == -1.dp ? 6.dp : indicatorPadding),
    ),
  );
}

class CircleTabIndicator extends Decoration {
  const CircleTabIndicator({
    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
  });

  final BorderSide borderSide;

  final EdgeInsetsGeometry insets;

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is CircleTabIndicator) {
      return CircleTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is CircleTabIndicator) {
      return CircleTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter(this, onChanged);
  }

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    RRect.fromLTRBR(
      indicator.left,
      indicator.bottom - borderSide.width,
      indicator.left + indicator.width,
      indicator.bottom,
      const Radius.circular(2),
    );
    return Rect.fromLTWH(
      indicator.left,
      indicator.bottom - borderSide.width,
      indicator.width,
      borderSide.width,
    );
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    return Path()..addRect(_indicatorRectFor(rect, textDirection));
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  final CircleTabIndicator decoration;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = decoration
        ._indicatorRectFor(rect, textDirection)
        .deflate(decoration.borderSide.width / 2.0);
    final Paint paint = decoration.borderSide.toPaint()
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}
