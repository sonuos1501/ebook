import 'package:base_https/vn.base.https/data/dto/base_dto.dart';

class MsgDto extends BaseDto {
  MsgDto({
    required String? msg,
    required int? code,
  });

  MsgDto.fromJson(Map<String, dynamic> json) {
    this.msg = json['msg'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    return data;
  }

  @override
  String toString() {
    return '''
      msg = $msg
      code = $code 
   ''';
  }
}
