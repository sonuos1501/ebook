import 'package:base_https/vn.base.https/data/dto/base_dto.dart';

class RefreshDto extends BaseDto {
  String? accessToken;
  String? refreshToken;

  RefreshDto({
    this.accessToken,
    this.refreshToken,
  });

  RefreshDto.fromJson(Map<String, dynamic> json) {
    accessToken = json['refreshToken']['accessToken'];
    refreshToken = json['refreshToken']['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = {
      'refreshToken': {
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      }
    };
    return data;
  }

  @override
  String toString() {
    return '''
      accessToken = $accessToken
      refreshToken = $refreshToken 
   ''';
  }
}
