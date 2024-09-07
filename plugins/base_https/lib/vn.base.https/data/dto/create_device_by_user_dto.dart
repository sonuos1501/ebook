import 'package:base_https/vn.base.https/data/dto/base_dto.dart';

class CreateDeviceByUserDto extends BaseDto {
  String? deviceId;
  String? deviceName;
  String? userId;
  String? osVersion;

  CreateDeviceByUserDto({
    this.deviceId,
    this.deviceName,
    this.userId,
    this.osVersion,
  });

  CreateDeviceByUserDto.fromJson(Map<dynamic, dynamic> json) {
    deviceId = json['createOneDeviecByUser']['deviceId'];
    deviceName = json['createOneDeviecByUser']['deviceName'];
    userId = json['createOneDeviecByUser']['userId'];
    osVersion = json['createOneDeviecByUser']['osVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createOneDeviecByUser'] = {
      'deviceId': deviceId,
      'deviceName': deviceName,
      'userId': userId,
      'osVersion': osVersion,
    };
    return data;
  }

  @override
  String toString() {
    return '''
      deviceId = $deviceId
      deviceName = $deviceName
      osVersion = $userId
      deviceId = $osVersion
   ''';
  }
}
