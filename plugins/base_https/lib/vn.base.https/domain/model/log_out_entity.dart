import 'package:base_https/vn.base.https/data/dto/logout_dto.dart';

class LogOutEntity {
  final bool logout;

  LogOutEntity(this.logout);

  static toEntity(LogOutDto dto) {
    return LogOutEntity(dto.logout ?? false);
  }
}
