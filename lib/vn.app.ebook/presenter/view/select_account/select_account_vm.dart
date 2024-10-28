import 'package:base_core/vn.base.cores/utils/src/storages/storages_helper_implementions.dart';
import 'package:base_https/vn.base.https/domain/model/ParrentProfileEntity.dart';
import 'package:ebook/r.dart';

import '../ebook_host/ebook_host_vm.dart';

class SelectAccountViewModel extends EbookHostViewModel {
  final users = [
    ChildrenEntity(
      id: '0',
      avatar: R.avatarsImgAvatar01Female,
      name: "Thủy",
      gender: 'Female',
      grade: 2,
    ),
    ChildrenEntity(
      id: '1',
      avatar: R.avatarsImgAvatar06Male,
      name: "Sơn",
      gender: 'Male',
      grade: 5,
    ),
  ];

  void chooseUser(userIndex) {
    currentUser = users[userIndex];
    if (StoragesHelperImpl.instance.childrenEntity?.grade !=
        currentUser.grade) {
      StoragesHelperImpl.instance.saveBooksReadRecently([]);
      booksReadRecently = [];
    }

    StoragesHelperImpl.instance.saveChildrenEntity(currentUser);
    booksByClass = StoragesHelperImpl.instance.booksByClass(
      idBookPublisher: StoragesHelperImpl.instance.idBookPublisher ?? 0,
      idClass: (currentUser.grade ?? 1) - 1,
    );
    booksReadRecently =
        StoragesHelperImpl.instance.childrenEntity?.id != currentUser.id
            ? []
            : booksReadRecently;
    update();
  }
}
