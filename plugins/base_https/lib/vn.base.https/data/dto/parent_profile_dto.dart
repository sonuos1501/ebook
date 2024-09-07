import 'package:base_https/vn.base.https/data/dto/school_dto.dart';

import 'base_dto.dart';

class ParentProfileDto extends BaseDto {
  MeDto? me;
  List<ChildrenDto>? children;

  ParentProfileDto({this.me, this.children});

  ParentProfileDto.fromJson(Map<String, dynamic> json) {
    var _me = json['me'];
    // var _children = json['children'];

    me = _me != null ? new MeDto.fromJson(_me) : null;

    // if (_children != null) {
    //   children = <ChildrenDto>[];
    //   _children.forEach((v) {
    //     children!.add(new ChildrenDto.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.me != null) {
      data['me'] = this.me!.toJson();
    }
    // if (this.children != null) {
    //   data['children'] = this.children!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class MeDto {
  String? id;
  String? name;
  String? email;
  String? avatar;
  String? phone;

  MeDto({this.id, this.name, this.email, this.avatar, this.phone});

  MeDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['phone'] = this.phone;
    return data;
  }
}

class ChildrenDto {
  String? id;
  String? name;
  String? birthday;
  String? gender;
  bool? isDeleted;
  String? password;
  int? grade;
  String? avatar;
  SchoolDto? school;

  ChildrenDto(
      {this.id,
      this.name,
      this.birthday,
      this.gender,
      this.isDeleted,
      this.password,
      this.grade,
      this.avatar,
      this.school});

  ChildrenDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    birthday = json['birthday'];
    gender = json['gender'];
    isDeleted = json['isDeleted'];
    password = json['password'];
    grade = json['grade'];
    avatar = json['avatar'];
    school = json['school'] == null ? null : SchoolDto.fromJson(json['school']);
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
    data['school'] = this.school;
    return data;
  }
}

class ChangePasswordDto {
  String? id;
  String? name;
  String? code;
  String? email;

  ChangePasswordDto({this.id, this.name, this.code, this.email});

  ChangePasswordDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['email'] = this.email;
    return data;
  }
}
