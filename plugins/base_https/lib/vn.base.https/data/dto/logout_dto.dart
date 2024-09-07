import 'base_dto.dart';

class LogOutDto extends BaseDto {
  bool? logout;

  LogOutDto({
    this.logout,
  });

  LogOutDto.fromJson(Map<dynamic, dynamic> json) {
    logout = json['logout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logout'] = logout;
    return data;
  }

  @override
  String toString() {
    return '''
      logout = $logout
   ''';
  }
}
