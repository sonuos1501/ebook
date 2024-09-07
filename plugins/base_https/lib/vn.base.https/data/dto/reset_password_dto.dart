import 'package:base_https/vn.base.https/data/dto/base_dto.dart';

class ResetPasswordDto extends BaseDto {
  bool? resetPassword;

  ResetPasswordDto({
    this.resetPassword,
  });

  ResetPasswordDto.fromJson(Map<dynamic, dynamic> json) {
    resetPassword = json['resetPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resetPassword'] = resetPassword;
    return data;
  }

  @override
  String toString() {
    return '''
      resetPassword = $resetPassword
   ''';
  }
}
