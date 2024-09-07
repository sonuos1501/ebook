import 'package:base_https/vn.base.https/data/dto/link_dto.dart';

class LinkEntity {
  final String id;
  final String link;
  bool? status;
  final String? childId;
  final String? createdAt;

  LinkEntity({
    required this.id,
    required this.link,
    this.status,
    this.childId,
    this.createdAt,
  });

  static LinkEntity toEntity(LinkDto dto) {
    return LinkEntity(
      id: dto.id ?? '',
      link: dto.link ?? '',
      status: dto.status,
      childId: dto.childId,
      createdAt: dto.createdAt,
    );
  }
}
