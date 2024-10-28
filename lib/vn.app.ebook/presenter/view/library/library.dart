import 'dart:convert';

import 'package:base_core/vn.base.cores/utils/src/storages/storages_helper_implementions.dart';
import 'package:base_https/vn.base.https/domain/model/ParrentProfileEntity.dart';
import 'package:ebook/routers.dart';
import 'package:ebook/vn.app.common/presenter/view/base_view.dart';
import 'package:ebook/vn.app.ebook/presenter/model/books.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  void choseLibrary(int id) async {
    final idBookPublisher = StoragesHelperImpl.instance.idBookPublisher ?? 0;
    if (idBookPublisher != id) {
      const nameLibrary = 'chantroisangtao';
      showLoading();
      for (var i = 0; i < 12; i++) {
        final jsonString =
            await rootBundle.loadString('books/$nameLibrary/$i/$i.json');
        final classTextBook = Class.fromJson(jsonDecode(jsonString));
        StoragesHelperImpl.instance.saveBooksByClass(
          classTextBook.books,
          idBookPublisher: id,
          idClass: i,
        );
        StoragesHelperImpl.instance.saveBookPublisher(id);
        StoragesHelperImpl.instance.saveBooksReadRecently([]);
        vm.booksReadRecently = [];
      }
      hideLoading();
    }

    final childrenEntity = StoragesHelperImpl.instance.childrenEntity;
    vm.booksByClass = StoragesHelperImpl.instance.booksByClass(
      idBookPublisher: id,
      idClass: (childrenEntity?.grade ?? 1) - 1,
    );
    vm.booksReadRecently = StoragesHelperImpl.instance.booksReadRecently;
    vm.disableTabTextBook = false;
    vm.selectedIndex = 0;
    vm.update();
    Get.toNamed(Routers.textBook, arguments: widget.currentUser);
  }
}
