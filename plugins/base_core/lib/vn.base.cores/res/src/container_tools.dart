part of resources;

final containerTools = _ContainerTools();

class _ContainerTools {
  /// child
  /// colors 渐变色
  ///  hrov 横向或者竖向
  /// borderColor 边框颜色
  /// borderSize 边框颜色
  /// circular 圆角度
  Widget getContainerGradien(
      {required Widget child,
      required List<Color> colors,
      bool hrov = true,
      Color borderColor = Colors.transparent,
      double borderSize = 0,
      double circular = 0,
      EdgeInsets? padding,
      EdgeInsets? margin,
      double offsetDx = 0.5,
      double offsetDy = 0.5,
      double w = double.infinity,
      double h = double.infinity}) {
    return Container(
      width: w,
      height: h,
      alignment: Alignment.center,
      margin: margin ?? EdgeInsets.all(0),
      padding: padding ?? EdgeInsets.all(0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colours.c666666,
            offset: Offset(offsetDx, offsetDy),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
        border: Border.all(color: borderColor, width: borderSize),
        borderRadius: BorderRadius.circular(circular),
        gradient: LinearGradient(
          colors: colors,
          begin: hrov ? Alignment.topLeft : Alignment.topCenter,
          end: hrov ? Alignment.bottomRight : Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }

  /// child
  /// color  背景
  /// borderColor 边框颜色
  /// borderSize 边框颜色
  /// circular 圆角度
  Widget getContainer({
    required Widget child,
    Color color = Colours.white,
    Color borderColor = Colors.transparent,
    double borderSize = 0,
    double circular = 0,
    EdgeInsets? padding,
    List<BoxShadow>? boxShadow,
    EdgeInsets? margin,
    Alignment alignment = Alignment.center,
    double w = double.infinity,
    double h = double.infinity,
  }) {
    return Container(
      alignment: alignment,
      margin: margin ?? const EdgeInsets.all(0),
      padding: padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderSize),
        borderRadius: BorderRadius.circular(circular),
        boxShadow: boxShadow,
        color: color,
      ),
      child: child,
    );
  }
}
