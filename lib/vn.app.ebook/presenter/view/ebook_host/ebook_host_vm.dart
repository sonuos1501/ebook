import 'package:base_core/vn.base.cores/common/config.dart';
import 'package:base_core/vn.base.cores/utils/src/storages/storages_helper_implementions.dart';
import 'package:base_https/vn.base.https/domain/model/ParrentProfileEntity.dart';
import 'package:ebook/vn.app.common/presenter/view/base_view.dart';
import 'package:get/get.dart';

import '../../model/books.dart';

class EbookHostViewModel extends BaseViewModel {
  late ChildrenEntity currentUser;
  double progressDownload = 0.0;
  int selectedIndex = 0;
  List<Book> booksByClass = [];
  List<Book> booksReadRecently = [];
  String? nameBookPublisher;
  bool disableTabTextBook = false;

  void loaded() {
    final idBookPublisher = StoragesHelperImpl.instance.idBookPublisher;
    if (idBookPublisher == null) {
      selectedIndex = 1;
      disableTabTextBook = true;
      update();
      return;
    }

    logger.i(currentUser.grade ?? 0);
    StoragesHelperImpl.instance.booksByClass(
      idBookPublisher: idBookPublisher,
      idClass: (currentUser.grade ?? 1) - 1,
    );
    booksReadRecently = StoragesHelperImpl.instance.booksReadRecently;
    update();
  }

  void readBookRecently(Book book) {
    booksReadRecently = StoragesHelperImpl.instance.booksReadRecently;
    booksReadRecently
      ..removeWhere((element) => element.id == book.id)
      ..insert(0, book);

    update();
    StoragesHelperImpl.instance.saveBooksReadRecently(booksReadRecently);
  }

  void downloadBooks(Book? book) async {
    try {
      progressDownload = 0;
      update();
      final idBookPublisher = StoragesHelperImpl.instance.idBookPublisher;
      if (book != null) {
        final newBookLink = await BookPublisherData.downloadFile(
          book.link,
          onReceiveProgress: (count, total) {
            final progress = count / total;
            progressDownload = progress;
            update();
            if (progress == 1) {}
          },
        );
        final updatedBook = book.copyWith(link: newBookLink);

        final childrenEntity = StoragesHelperImpl.instance.childrenEntity;

        final booksByClass = StoragesHelperImpl.instance.booksByClass(
          idBookPublisher: idBookPublisher ?? 0,
          idClass: (childrenEntity?.grade ?? 1) - 1,
        );

        for (var i = 0; i < booksByClass.length; i++) {
          if (booksByClass[i].id == updatedBook.id) {
            booksByClass[i] = updatedBook;
            break;
          }
        }

        StoragesHelperImpl.instance.saveBooksByClass(
          booksByClass,
          idBookPublisher: idBookPublisher ?? 0,
          idClass: (childrenEntity?.grade ?? 1) - 1,
        );
      }
      loaded();
      Get.back();
    } catch (_) {
      Get.back();
    }
  }
}
