import 'package:base_https/vn.base.https/data/dto/base_dto.dart';

class SendOtpDto extends BaseDto {
  String? refreshToken;
  String? accessToken;

  SendOtpDto({
    this.refreshToken,
    this.accessToken,
  });

  SendOtpDto.fromJson(Map<dynamic, dynamic> json) {
    refreshToken = json['verify']['refreshToken'];
    accessToken = json['verify']['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verify'] = {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
    return data;
  }

  @override
  String toString() {
    return '''
      refreshToken = $refreshToken
      accessToken = $accessToken
   ''';
  }
}
