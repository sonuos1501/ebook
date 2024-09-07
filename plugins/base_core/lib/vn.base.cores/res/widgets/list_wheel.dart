import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:flutter/material.dart';

import 'load_image.dart';

class baseWheelModel {
  final String itemName;
  final bool showWarning;
  baseWheelModel(this.itemName, this.showWarning);
}

class baseListWheel extends StatefulWidget {
  const baseListWheel({
    super.key,
    required this.listItem,
    required this.iconWarning,
    required this.onSelectedItem,
  });

  final List<baseWheelModel> listItem;
  final Function(int index, String title) onSelectedItem;
  final String iconWarning;
  @override
  State<baseListWheel> createState() => _baseListWheelState();
}

class _baseListWheelState extends State<baseListWheel> {
  int _indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return _wheelTextView();
  }

  bool _isSelecting(int index) {
    return _indexSelected == index;
  }

  _wheelTextView() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.dp), // color: Colors.red,
      //   height: 1000,
      child: ListWheelScrollView(
        onSelectedItemChanged: (index) {
          widget.onSelectedItem(index, widget.listItem[index].itemName);
          setState(() {
            _indexSelected = index;
          });
        },
        itemExtent: 60.dp,
        diameterRatio: 6,
        children: List.generate(
          widget.listItem.length,
          (index) => Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 0.dp, vertical: 16.dp),
              color:
                  _isSelecting(index) ? const Color(0xFFDDD8FF) : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.zero,
                      child: Text(
                        widget.listItem[index].itemName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: _isSelecting(index)
                            ? textSize20.copyWith(
                                color: const Color(0xFF3C2C9E),
                                fontWeight: FontWeight.bold)
                            : textSize18.copyWith(
                                color: const Color(0xFF5B5B5B),
                              ),
                      ),
                    ),
                  ),
                  Gaps.hGap8,
                  if (widget.listItem[index].showWarning)
                    LoadImage(widget.iconWarning, width: 20.dp),
                ],
              )),
        ),
      ),
    );
  }
}
