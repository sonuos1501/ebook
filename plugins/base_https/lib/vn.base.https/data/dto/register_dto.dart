import 'package:base_https/vn.base.https/data/dto/base_dto.dart';

class RegisterDto extends BaseDto {
  bool? register;

  RegisterDto({
    this.register,
  });

  RegisterDto.fromJson(Map<dynamic, dynamic> json) {
    register = json['register'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['register'] = register;
    return data;
  }

  @override
  String toString() {
    return '''
      register = $register
   ''';
  }
}
