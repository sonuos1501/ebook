class AppLogDto {
  String? childId;
  String? deviceId;
  String? appId;
  String? package;
  int? count;
  String? startTime;
  String? endTime;

  AppLogDto(
      {this.childId,
      this.deviceId,
      this.appId,
      this.package,
      this.count,
      this.startTime,
      this.endTime});

  AppLogDto.fromJson(Map<String, dynamic> json) {
    childId = json['childId'];
    deviceId = json['deviceId'];
    appId = json['appId'];
    package = json['app']['package'];
    count = json['count'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['childId'] = this.childId;
    data['deviceId'] = this.deviceId;
    data['appId'] = this.appId;
    data['package'] = this.package;
    data['count'] = this.count;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}
