import 'dart:convert';

import 'package:base_https/vn.base.https/data/dto/base_dto.dart';

class NotificationDto extends BaseDto {
  NotificationDto({
    required this.title,
    required this.notifies,
    required String msg,
    required int code,
  }) : super(msg: msg, code: code);

  final String? title;
  final List<ItemNotifyDto>? notifies;

  factory NotificationDto.fromJson(String str) =>
      NotificationDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationDto.fromMap(Map<String, dynamic> json) => NotificationDto(
        msg: json['msg'],
        code: json['code'],
        title: json['title'],
        notifies: json['notifies'],
      );

  Map<String, dynamic> toMap() => {
        'msg': msg,
        'title': title,
        'notifies': notifies,
      };
}

class ItemNotifyDto extends BaseDto {
  ItemNotifyDto({
    required this.title,
    required this.message,
    required this.id,
    required this.type,
    required this.time,
    this.seen = false,
    this.delete = false,
  });

  final String? title;
  final String? message;
  final int? id;
  final int? type;
  final int? time;
  bool seen;
  bool delete;

  factory ItemNotifyDto.fromJson(String str) =>
      ItemNotifyDto.fromMap(json.decode(json.decode(str)));

  String toJson() => json.encode(toMap());

  factory ItemNotifyDto.fromMap(Map<String, dynamic> json) => ItemNotifyDto(
        title: json['title'],
        message: json['message'],

        ///force type casting string to int (hot fix)
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        type: json['type'] is int ? json['type'] : int.parse(json['type']),
        time: json['time'] is int ? json['time'] : int.parse(json['time']),
        seen: json['seen'] ?? false,
        delete: json['delete'] ?? false,
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'message': message,
        'id': id,
        'type': type,
        'time': time,
        'seen': seen,
        'delete': delete,
      };
}
