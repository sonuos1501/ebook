import 'package:base_https/vn.base.https/data/dto/school_dto.dart';

class SchoolEntity {
  String id;
  String? code;
  String? name;
  String? province;
  String? district;

  SchoolEntity({
    required this.id,
    this.code,
    this.name,
    this.province,
    this.district,
  });

  static SchoolEntity toEntity(SchoolDto? dto) {
    return SchoolEntity(
      id: dto?.id ?? 'N/A',
      code: dto?.code,
      name: dto?.name,
      province: dto?.province,
      district: dto?.district,
    );
  }

  static SchoolEntity fromJson(Map<String, dynamic> json) {
    return SchoolEntity(
        id: json['id'] ?? 'N/A',
        name: json['name'],
        code: json['code'],
        province: json['province'],
        district: json['district']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['province'] = this.province;
    data['district'] = this.district;
    return data;
  }
}
