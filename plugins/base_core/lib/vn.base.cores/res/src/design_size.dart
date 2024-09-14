part of resources;

final ds = _DesignSizes();

class _DesignSizes {
  // r
  final r10 = Radius.circular(ScreenUtil.getInstance().getWidth(10));
  final r12 = Radius.circular(ScreenUtil.getInstance().getWidth(12));

  // w
  final width = ScreenUtil.getInstance().screenWidth;
  // h
  final height = ScreenUtil.getInstance().screenHeight;
  // padding horizontal
  final horizontal = ScreenUtil.getInstance().getWidth(30);

  final statusBarHeight = ScreenUtil.getInstance().statusBarHeight;
  final bottomBarHeight = ScreenUtil.getInstance().bottomBarHeight;
}

extension IntExtension on int {
  double get dp {
    return ScreenUtil.getInstance().getWidth(toDouble());
  }

  double get sp {
    return ScreenUtil.getInstance().getSp(toDouble());
  }
}

extension DoubleExtension on double {
  double get dp {
    return ScreenUtil.getInstance().getWidth(this);
  }

  double get sp {
    return ScreenUtil.getInstance().getSp(this);
  }
}
