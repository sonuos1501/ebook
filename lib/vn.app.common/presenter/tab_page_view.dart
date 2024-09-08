// ignore_for_file: non_constant_identifier_names

import 'package:base_core/vn.base.cores/common/constant.dart';
import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:flutter/material.dart';
import 'package:base_core/vn.base.cores/res/widgets/blink_item.dart';

class TabItemModel {
  final String label;
  bool isFocused;

  TabItemModel({required this.label, required this.isFocused});
}

Widget _FocusedRoundedTabItem({
  required String tabLabel,
  required int position,
  required Function(int position) onButtonClicked,
}) {
  return Expanded(
    child: Container(
      height: 36.dp,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(40.dp)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 2.dp,
            spreadRadius: 1.dp,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tabLabel,
            textAlign: TextAlign.center,
            style: textSize16.copyWith(
              color: const Color(0xFF155EEF),
              fontFamily: fontBold,
            ),
          )
        ],
      ),
    ),
  );
}

Widget _UnfocusedRoundedTabItem({
  required String tabLabel,
  required int position,
  required Function(int position) onButtonClicked,
}) {
  return Expanded(
    child: BlinkItem(
      child: Container(
        height: double.maxFinite,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Text(
          tabLabel,
          textAlign: TextAlign.center,
          style: textSize16.copyWith(
            color: const Color(0xFF6E6E6E),
            fontFamily: fontMedium,
          ),
        ),
      ),
      callback: (v) {
        onButtonClicked(position);
      },
    ),
  );
}

Widget RoundedTab({
  required double height,
  int initialPosition = 0,
  required List<TabItemModel> items,
  required Function(int position) onTabClicked,
}) {
  return Container(
    height: height,
    decoration: BoxDecoration(
      color: const Color(0xFFF2F2F2),
      borderRadius: BorderRadius.all(Radius.circular(40.dp)),
    ),
    child: Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 4.dp),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _getTabChildren(items: items, onButtonClicked: onTabClicked),
      ),
    ),
  );
}

List<Widget> _getTabChildren({
  required List<TabItemModel> items,
  required Function(int position) onButtonClicked,
}) {
  return items
      .map((e) => e.isFocused
          ? _FocusedRoundedTabItem(
              tabLabel: e.label,
              position: items.indexOf(e),
              onButtonClicked: (position) {})
          : _UnfocusedRoundedTabItem(
              tabLabel: e.label,
              position: items.indexOf(e),
              onButtonClicked: onButtonClicked))
      .toList();
}
