import 'package:base_https/vn.base.https/domain/model/ParrentProfileEntity.dart';
import 'package:ebook/vn.app.common/presenter/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text_book_screen.dart';
import 'text_book_vm.dart';

class TextBookState extends StatefulWidget {
  final ChildrenEntity currentUser;
  const TextBookState({
    super.key,
    required this.currentUser,
  });

  @override
  TextBook createState() => TextBook();
}

class TextBook extends BaseScreen<TextBookState, TextBookViewModel> {
  @override
  void initViewModel() {
    Get.lazyPut(() => TextBookViewModel());
  }

  @override
  void initState() {
    super.initState();
    vm.currentUser = widget.currentUser;
  }

  @override
  Widget initWidget(BuildContext context, double topHeight) {
    return TextBookScreen(this, context).screen();
  }
}
