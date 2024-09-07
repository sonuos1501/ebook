import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../resources.dart';
import 'loading.dart';

Widget getSmartRefresher({
  required RefreshController controller,
  required Widget child,
  VoidCallback? onLoading,
  VoidCallback? onRefresh,
  enablePullUp = true,
  enablePullDown = true,
  String tooltip = 'Làm mới',
  Widget? footer,
}) {
  return SmartRefresher(
    enablePullUp: enablePullUp,
    enablePullDown: enablePullDown,
    controller: controller,
    child: child,
    onLoading: onLoading,
    onRefresh: onRefresh,
    header: CustomHeader(
      builder: (context, mode) {
        return Loading(text: tooltip).paddingOnly(bottom: 10.dp);
      },
      height: 120.dp,
    ),
    footer: footer ??
        CustomFooter(
          builder: (
            BuildContext context,
            LoadStatus? mode,
          ) {
            Widget body = Text(
              'Kéo để tải thêm',
              style: textSize12.copyWith(color: Colours.main),
            );
            if (mode == LoadStatus.idle) {
              body = Text('Hoàn thành...',
                  style: textSize12.copyWith(color: Colours.main));
            } else if (mode == LoadStatus.loading) {
              body = Loading(text: 'Đang tải...');
            } else if (mode == LoadStatus.failed) {
              body = Text('Lỗi...',
                  style: textSize12.copyWith(color: Colours.main));
            } else if (mode == LoadStatus.canLoading) {
              body = Text('Tải thêm?',
                  style: textSize12.copyWith(color: Colours.main));
            }
            return SizedBox(
              child: Center(child: body),
            ).paddingOnly(bottom: 10.dp);
          },
        ),
  );
}