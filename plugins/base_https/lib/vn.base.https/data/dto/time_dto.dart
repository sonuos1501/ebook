class TimeDto {
  String? id;
  String? rule;
  String? type;
  String? createdAt;
  String? childId;
  int? times;
  int? duration;
  String? startTime;
  String? endTime;
  List<WeekdaysDto>? weekdays;

  TimeDto(
      {this.id,
        this.rule,
        this.type,
        this.times,
        this.duration,
        this.startTime,
        this.endTime,
        this.createdAt,
        this.childId,
        this.weekdays});

  TimeDto.fromJson(String keyName, Map<String, dynamic> json) {
    var data = json[keyName];
    if(data == null) return;
    id = json[keyName]['id'];
    rule = json[keyName]['rule'];
    type = json[keyName]['type'];
    times = json[keyName]['times'];
    duration = json[keyName]['duration'];
    startTime = json[keyName]['startTime'];
    endTime = json[keyName]['endTime'];
    createdAt = json[keyName]['createdAt'];
    childId = json[keyName]['childId'];
    if (json[keyName]['weekdays'] != null) {
      weekdays = <WeekdaysDto>[];
      json[keyName]['weekdays'].forEach((v) {
        weekdays!.add(new WeekdaysDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap(String keyName) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[keyName] = {
      'id': this.id,
      'rule': this.rule,
      'type': this.type,
      'times': this.times,
      'duration': this.duration,
      'startTime': this.startTime,
      'endTime': this.endTime,
      'createdAt': this.createdAt,
      'childId': this.childId,
      'weekdays': this.weekdays!
    };

    return data;
  }
}

class WeekdaysDto {
  String? name;
  String? rule;
  String? startTime;
  String? endTime;
  int? times;
  int? duration;

  WeekdaysDto(
      {this.name,
        this.rule,
        this.startTime,
        this.endTime,
        this.times,
        this.duration});

  WeekdaysDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rule = json['rule'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    times = json['times'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['rule'] = this.rule;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['times'] = this.times;
    data['duration'] = this.duration;
    return data;
  }
}