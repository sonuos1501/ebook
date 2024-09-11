import 'package:base_https/vn.base.https/domain/model/ParrentProfileEntity.dart';
import 'package:ebook/vn.app.common/presenter/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'library_screen.dart';
import 'library_vm.dart';

class LibraryState extends StatefulWidget {
  final ChildrenEntity currentUser;
  const LibraryState({
    super.key,
    required this.currentUser,
  });

  @override
  Library createState() => Library();
}

class Library extends BaseScreen<LibraryState, LibraryViewModel> {
  @override
  void initState() {
    super.initState();
    vm.currentUser = widget.currentUser;
  }

  @override
  void initViewModel() {
    Get.lazyPut(() => LibraryViewModel());
  }

  @override
  Widget initWidget(BuildContext context, double topHeight) {
    return LibraryScreen(this, context).screen();
  }
}
