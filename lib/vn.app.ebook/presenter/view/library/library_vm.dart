import 'package:base_https/vn.base.https/domain/model/ParrentProfileEntity.dart';
import 'package:ebook/r.dart';
import 'package:ebook/vn.app.common/presenter/view/base_view.dart';

import '../../model/books.dart';

class LibraryViewModel extends BaseViewModel {
  late ChildrenEntity currentUser;
  final library = [
    const BookPublisher(
      id: 0,
      name: 'Chân trời sáng tạo',
      image: R.logoBooklogoChantroisangtao,
      color: '#4CAF50',
      listClass: [],
    ),
  ];
}
