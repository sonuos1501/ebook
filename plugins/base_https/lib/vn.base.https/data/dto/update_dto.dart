import 'package:base_https/vn.base.https/data/dto/base_dto.dart';

class UpdateDto extends BaseDto {
  String? link;
  String? version;
  String? name;

  UpdateDto({
    this.link,
    this.version,
    this.name,
  });

  UpdateDto.fromJson(Map<dynamic, dynamic> json) {
    link = json['link'];
    version = json['version'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = link;
    data['version'] = version;
    data['name'] = name;
    return data;
  }

  @override
  String toString() {
    return '''
      link = $link,
      version = $version,
      name = $name,
   ''';
  }
}
