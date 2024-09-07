import 'package:base_https/vn.base.https/data/dto/base_dto.dart';

class AccountDto extends BaseDto {
  String? accessToken;
  String? refreshToken;

  AccountDto({
    this.accessToken,
    this.refreshToken,
  });

  AccountDto.fromJson(Map<String, dynamic> json) {
    accessToken = json['login']['accessToken'];
    refreshToken = json['login']['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = {
      'login': {
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      }
    };
    return data;
  }

  @override
  String toString() {
    return '''
      token = $accessToken
      refreshToken = $refreshToken 
   ''';
  }
}
