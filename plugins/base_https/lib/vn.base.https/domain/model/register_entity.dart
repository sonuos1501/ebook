import 'package:base_https/vn.base.https/data/dto/register_dto.dart';

class RegisterEntity {
  final bool register;

  RegisterEntity(this.register);

  static toEntity(RegisterDto dto) {
    return RegisterEntity(dto.register ?? false);
  }
}
