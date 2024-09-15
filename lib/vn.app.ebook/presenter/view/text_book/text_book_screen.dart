// ignore_for_file: depend_on_referenced_packages

import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:base_core/vn.base.cores/res/widgets/shimmer_item.dart';
import 'package:ebook/vn.app.common/presenter/view/splash/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/books.dart';
import 'text_book.dart';
import 'widgets/appbar_textbook.dart';
import 'widgets/item_book.dart';
import 'widgets/title_textbook.dart';

class TextBookScreen {
  final TextBook main;
  final BuildContext context;

  TextBookScreen(this.main, this.context);

  Widget screen() {
    return GetBuilder<SplashViewModel>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: mainBody(),
      );
    });
  }

  Widget mainBody() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: ds.horizontal),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Gaps.vGap35,
            const AppBarTextBook(),
            Gaps.vGap16,
            _buildBooksRecently(context),
            Expanded(child: _buildBooks(context, [])),
          ],
        ),
      ),
    );
  }

  Column _buildBooks(
    BuildContext context,
    List<Book> books,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleTextBook(
          title: 'Thư viện ${''}',
        ),
        Gaps.vGap15,
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.dp,
              crossAxisSpacing: 10.dp,
              mainAxisExtent: 400.dp,
            ),
            itemCount: books.isEmpty ? 7 : books.length,
            itemBuilder: (context, index) {
              if (books.isEmpty) {
                return ShimmerItem(width: 75.dp);
              }
              return ItemBook(
                book: books[index],
                onPressDownload: () async {},
                onPress: () async {},
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBooksRecently(BuildContext context) {
    final books = [];
    return books.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleTextBook(title: 'Gần đây'),
              Gaps.vGap15,
              SizedBox(
                height: 122.dp,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index == books.length - 1 ? 0 : 10,
                      ),
                      child: ItemBook(
                        book: books[index],
                        onPress: () async {},
                      ),
                    );
                  },
                ),
              ),
              Gaps.vGap15,
            ],
          );
  }
}
