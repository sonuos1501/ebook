import 'dart:convert';

import 'package:base_core/vn.base.cores/common/storage.dart';
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
    final idBookPublisher =
        StorageService.to.getInt(StorageService.keyIdBookPublisher) ?? 0;
    if (idBookPublisher != id) {
      const nameLibrary = 'chantroisangtao';
      showLoading();
      for (var i = 0; i < 12; i++) {
        final jsonString =
            await rootBundle.loadString('books/$nameLibrary/$i/$i.json');
        final classTextBook = Class.fromJson(jsonDecode(jsonString));
        await saveBooksByClass(
          classTextBook.books,
          idBookPublisher: id,
          idClass: i,
        );
        await StorageService.to.setInt(StorageService.keyIdBookPublisher, id);
        await saveBooksReadRecently([]);
      }
    }

    Get.toNamed(Routers.textBook, arguments: widget.currentUser);
  }

  Future<void> saveBooksByClass(
    List<Book> books, {
    required int idBookPublisher,
    required int idClass,
  }) async {
    final data = books.map((e) {
      return jsonEncode(e.toJson());
    }).toList();
    await StorageService.to.setList(
      '${StorageService.keyDataBook}_${idBookPublisher}_$idClass',
      data.isEmpty ? [] : data,
    );
  }

  Future<void> saveBooksReadRecently(List<Book> booksReadRecently) async {
    final books = booksReadRecently.map((e) {
      return jsonEncode(e.toJson());
    }).toList();
    await StorageService.to.setList(
      StorageService.keyBooksReadRecently,
      books.isEmpty ? [] : books,
    );
  }
}
