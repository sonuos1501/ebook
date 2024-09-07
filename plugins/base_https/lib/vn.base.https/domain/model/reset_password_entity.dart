import 'package:base_https/vn.base.https/data/dto/reset_password_dto.dart';

class ResetPasswordEntity {
  final bool resetPassword;

  ResetPasswordEntity(this.resetPassword);

  static toEntity(ResetPasswordDto dto) {
    return ResetPasswordEntity(dto.resetPassword ?? false);
  }
}
