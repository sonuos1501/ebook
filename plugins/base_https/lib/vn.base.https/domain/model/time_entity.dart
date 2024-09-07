import 'package:base_https/vn.base.https/data/dto/time_dto.dart';

class TimeEntity {
  String? id;
  String? rule;
  String? type;
  String? createdAt;
  String? startTime;
  String? endTime;
  String? childId;
  int? times;
  int? duration;
  List<WeekdaysEntity>? weekdays;

  TimeEntity(
      this.id,
      this.rule,
      this.type,
      this.times,
      this.duration,
      this.startTime,
      this.endTime,
      this.createdAt,
      this.childId,
      this.weekdays);

  static TimeEntity toEntity(TimeDto dto) {
    List<WeekdaysEntity>? weekdays =
        dto.weekdays?.map((e) => WeekdaysEntity.toEntity(e)).toList();
    weekdays?.sort((a, b) => a.index.compareTo(b.index));
    return TimeEntity(
      dto.id,
      dto.rule,
      dto.type,
      dto.times,
      dto.duration,
      dto.startTime,
      dto.endTime,
      dto.createdAt,
      dto.childId,
      weekdays,
    );
  }
}

class WeekdaysEntity {
  String? name;
  String? rule;
  String? startTime;
  String? endTime;
  int? times;
  int? duration;

  int get index {
    switch (name) {
      case 'MON':
        return 0;
      case 'TUE':
        return 1;
      case 'WED':
        return 3;
      case 'THU':
        return 4;
      case 'FRI':
        return 5;
      case 'SAT':
        return 6;
      case 'SUN':
        return 7;
      default:
        return 9;
    }
  }

  WeekdaysEntity(this.name, this.rule, this.startTime, this.endTime, this.times,
      this.duration);

  static WeekdaysEntity toEntity(WeekdaysDto dto) {
    return WeekdaysEntity(dto.name, dto.rule, dto.startTime, dto.endTime,
        dto.times, dto.duration);
  }
}
