import 'package:ebook/r.dart';
import 'package:ebook/vn.app.ebook/presenter/view/ebook_host/ebook_host_vm.dart';

import '../../model/books.dart';

class LibraryViewModel extends EbookHostViewModel {
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