class SchoolDto {
  String? id;
  String? code;
  String? name;
  String? province;
  String? district;

  SchoolDto({this.id, this.code, this.name, this.province, this.district});

  SchoolDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    province = json['province'];
    code = json['code'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['province'] = this.province;
    data['district'] = this.district;
    data['code'] = this.code;
    return data;
  }
}
