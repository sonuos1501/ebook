import 'package:base_https/vn.base.https/data/dto/version_dto.dart';

class VersionEntity {
  String? id;
  String? number;
  String? name;
  String? content;
  String? file;
  String? status;
  bool? isLast;

  VersionEntity(this.id, this.number, this.name, this.content, this.file,
      this.status, this.isLast);

  static VersionEntity toEntity(VersionDto dto) {
    return VersionEntity(dto.id, dto.number, dto.name, dto.content, dto.file,
        dto.status, dto.isLast);
  }
}
