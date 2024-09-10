import 'package:flutter/material.dart';

class BottomBarItemModel {
  final int index;
  final String id;
  final String? title;
  final String? icon;
  final String? iconSelected;
  final Widget child;

  BottomBarItemModel(
    this.index,
    this.id,
    this.title,
    this.icon,
    this.iconSelected,
    this.child,
  );
}
