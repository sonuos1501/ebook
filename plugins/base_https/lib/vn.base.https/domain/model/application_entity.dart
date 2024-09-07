import 'package:base_https/vn.base.https/data/dto/application_dto.dart';

class ApplicationEntity {
  final String? id;
  final String? name;
  final String? package;
  final bool? status;
  final String? childId;
  final String? state;
  final String? createdAt;

  ApplicationEntity(this.id, this.name, this.package, this.status, this.childId,
      this.state, this.createdAt);

  static ApplicationEntity toEntity(ApplicationDto dto) {
    return ApplicationEntity(dto.id, dto.name, dto.package, dto.status,
        dto.childId, dto.state, dto.createdAt);
  }

  @override
  String toString() {
    return '''
      id: $id
      name: $name
      package: $package
      bool: $bool
      childId: $childId
      state: $state
      createdAt: $createdAt
    ''';
  }
}
