import 'package:intl/intl.dart';
import 'package:base_https/vn.base.https/data/dto/parent_profile_dto.dart';
import 'package:base_https/vn.base.https/domain/model/school_entity.dart';

class ParentProfileEntity {
  MeEntity me;
  List<ChildrenEntity> children;

  ParentProfileEntity({
    required this.me,
    required this.children,
  });

  static toEntity(ParentProfileDto dto) {
    List<ChildrenEntity> _children =
        dto.children?.map((e) => ChildrenEntity.toEntity(e)).toList() ?? [];
    var _me = MeEntity.toEntity(dto.me);
    return ParentProfileEntity(me: _me, children: _children);
  }
}

class MeEntity {
  String id;
  String? name;
  String? email;
  String? avatar;
  String? phone;

  MeEntity({
    required this.id,
    this.name,
    this.email,
    this.avatar,
    this.phone,
  });

  static MeEntity toEntity(MeDto? dto) {
    return MeEntity(
      id: dto?.id ?? 'N/A',
      name: dto?.name,
      email: dto?.email,
      avatar: dto?.avatar,
      phone: dto?.phone,
    );
  }
}

class ChildrenEntity {
  String id;
  String? name;
  String? birthday;
  String? gender;
  bool? isDeleted;
  String? password;
  int? grade;
  String? avatar;
  SchoolEntity? school;

  setBirthDay({required DateTime value}) {
    // this.birthday = DateFormat(Constants.BIRTHDAY_DATE_FORMAT).format(value);
  }

  DateTime? getBirthDay() {
    if (birthday != null) {
      return DateFormat('yyyy-MM-dd').parse(birthday!, true);
    }
    return null;
  }

  String? birthDayDisplay() {
    var date = this.getBirthDay();
    if (date != null) {
      // return DateFormat(Constants.DATETIME_FORMAT_ddMMyyyy).format(date);
    }
    return null;
  }

  bool get isPasswordActive {
    return password != null && password != '';
  }

  ChildrenEntity({
    required this.id,
    this.name,
    this.birthday,
    this.gender,
    this.isDeleted,
    this.password,
    this.grade,
    this.avatar,
    this.school,
  });

  static ChildrenEntity toEntity(ChildrenDto dto) {
    return ChildrenEntity(
      id: dto.id ?? 'N/A',
      name: dto.name,
      birthday: dto.birthday,
      gender: dto.gender,
      isDeleted: dto.isDeleted,
      password: dto.password,
      grade: dto.grade,
      avatar: dto.avatar,
      school: dto.school == null ? null : SchoolEntity.toEntity(dto.school),
    );
  }

  static ChildrenEntity fromJson(Map<String, dynamic> json) {
    var result = ChildrenEntity(
      id: json['id'] ?? 'N/A',
      name: json['name'],
      birthday: json['birthday'],
      gender: json['gender'],
      isDeleted: json['isDeleted'],
      password: json['password'],
      avatar: json['avatar'],
      grade: json['grade'],
      school: null,
    );

    var school = json['school'];
    if (school != null && school is Map<String, dynamic>) {
      result.school = SchoolEntity.fromJson(school);
    }

    return result;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['isDeleted'] = this.isDeleted;
    data['password'] = this.password;
    data['grade'] = this.grade;
    data['avatar'] = this.avatar;
    data['school'] = this.school?.toJson();
    return data;
  }
}

class ChangePasswordEntity {
  String id;

  ChangePasswordEntity({
    required this.id,
  });

  static ChangePasswordEntity toEntity(ChangePasswordDto? dto) {
    return ChangePasswordEntity(
      id: dto?.id ?? 'N/A',
    );
  }
}
