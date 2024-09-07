import 'package:flutter/cupertino.dart';

class ListPageViewItem extends StatelessWidget {

  final Function(Object) onChild;
  final PageController pageController = PageController(viewportFraction: 0.92, initialPage: 0);
  final List<Object> listData;
  final double height;
  final Widget emptyWidget;

  ListPageViewItem(
      {Key? key,
        required this.emptyWidget,
        required this.onChild,
        required this.listData,
        required this.height,
      });

  @override
  Widget build(BuildContext context) {
    return listData.isEmpty ? emptyData() : SizedBox(
      height: height,
      child: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemCount: listData.length > 7 ? 7 : listData.length,
        itemBuilder: (BuildContext context, int index) {
          return onChild(listData[index]);
        },
      ),
    );
  }

  Widget emptyData() {
    return emptyWidget;
  }

}

