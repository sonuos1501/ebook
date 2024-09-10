import 'package:base_core/vn.base.cores/common/constant.dart';
import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:base_core/vn.base.cores/res/widgets/blink_item.dart';
import 'package:flutter/material.dart';

class BuildTab extends StatelessWidget {
  const BuildTab({
    super.key,
    required this.index,
    required this.title,
    required this.selectedTab,
    required this.selectedIndex,
  });

  final int index;
  final int selectedIndex;
  final String title;
  final void Function(int) selectedTab;

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;
    return BlinkItem(
      callback: (v) {
        selectedTab(index);
      },
      child: Container(
        height: 75.dp,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: isSelected ? Radius.circular(17.dp) : Radius.zero,
            topRight: isSelected ? Radius.circular(17.dp) : Radius.zero,
          ),
          color: isSelected ? Colours.bard[600] : Colors.transparent,
        ),
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: textSize26.copyWith(
            fontFamily: fontBold,
            color: isSelected ? Colours.white : Colours.greyLight[600],
          ),
          softWrap: false,
        ),
      ),
    );
  }
}
