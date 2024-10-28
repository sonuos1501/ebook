import 'package:base_https/vn.base.https/domain/model/ParrentProfileEntity.dart';
import 'package:ebook/vn.app.common/presenter/view/base_view.dart';

import '../../model/books.dart';

class EbookHostViewModel extends BaseViewModel {
  late ChildrenEntity currentUser;
  double progressDownload = 0.0;
  int selectedIndex = 0;
  List<Book> booksByClass = [];
  ChildrenEntity? childrenEntity;
  List<Book> booksReadRecently = [];
  String? nameBookPublisher;
  bool disableTabTextBook = false;

  void readBookRecently(Book book) {
    final booksReadReacently = 
  }
}
