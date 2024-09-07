import 'package:base_https/vn.base.https/data/dto/send_otp_dto.dart';

class SendOtpEntity {
  final String? refreshToken;
  final String? accessToken;

  SendOtpEntity(this.refreshToken, this.accessToken);

  static toEntity(SendOtpDto dto) {
    return SendOtpEntity(dto.refreshToken ?? null, dto.accessToken ?? null);
  }
}
