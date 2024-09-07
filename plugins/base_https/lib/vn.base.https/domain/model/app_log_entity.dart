import 'package:base_https/vn.base.https/data/dto/app_log_dto.dart';

class AppLogEntity {
  final String? childId;
  final String? deviceId;
  final String? appId;
  final String? package;
  final int? count;
  final String? startTime;
  final String? endTime;

  AppLogEntity(this.childId, this.deviceId, this.appId, this.package,
      this.count, this.startTime, this.endTime);

  static AppLogEntity toEntity(AppLogDto dto) {
    return AppLogEntity(dto.childId, dto.deviceId, dto.appId, dto.package,
        dto.count, dto.startTime, dto.endTime);
  }
}
