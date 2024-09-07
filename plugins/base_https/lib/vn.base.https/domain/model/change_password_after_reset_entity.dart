import 'package:base_https/vn.base.https/data/dto/change_password_after_reset_dto.dart';

class ChangePasswordAfterResetEntity {
  String id;

  ChangePasswordAfterResetEntity({
    required this.id,
  });

  static ChangePasswordAfterResetEntity toEntity(
      ChangePasswordAfterResetDto? dto) {
    return ChangePasswordAfterResetEntity(
      id: dto?.id ?? 'N/A',
    );
  }
}
