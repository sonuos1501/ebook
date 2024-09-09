import 'package:base_https/vn.base.https/domain/model/ParrentProfileEntity.dart';
import 'package:ebook/r.dart';
import 'package:ebook/vn.app.common/presenter/view/base_view.dart';

class SelectAccountViewModel extends BaseViewModel {
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
}
