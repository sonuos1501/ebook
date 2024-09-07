import 'package:base_https/vn.base.https/data/dto/create_device_by_user_dto.dart';

class CreateDeviceByUserEntity {
  final String? deviceId;
  final String? deviceName;
  final String? userId;
  final String? osVersion;

  CreateDeviceByUserEntity(
      this.deviceId, this.deviceName, this.userId, this.osVersion);

  static toEntity(CreateDeviceByUserDto dto) {
    return CreateDeviceByUserEntity(dto.deviceId ?? null,
        dto.deviceName ?? null, dto.userId ?? null, dto.osVersion ?? null);
  }
}
