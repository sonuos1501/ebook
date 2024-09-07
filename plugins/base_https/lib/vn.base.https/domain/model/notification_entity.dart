import 'dart:convert';

import 'package:base_https/vn.base.https/data/dto/notification_dto.dart';

class NotificationEntity {
  final String? title;
  final List<ItemNotifyEntity>? notifies;

  NotificationEntity(this.title, this.notifies);

  static toEntity(NotificationDto dto) {
    return NotificationEntity(
      dto.title,
      dto.notifies
          ?.map((e) => ItemNotifyEntity(
              e.id, e.type, e.title, e.message, e.time, e.seen, e.delete))
          .toList(),
    );
  }

  @override
  String toString() {
    return '''
      title: $title
      notifies: $notifies
    ''';
  }
}

class ItemNotifyEntity {
  final int? id;
  final int? type;
  final String? title;
  final String? message;
  final int? time;
  bool seen;
  bool delete;

  ItemNotifyEntity(
    this.id,
    this.type,
    this.title,
    this.message,
    this.time,
    this.seen,
    this.delete,
  );

  static toEntity(ItemNotifyDto? dto) {
    return ItemNotifyEntity(
      dto?.id,
      dto?.type,
      dto?.title,
      dto?.message,
      dto?.time,
      dto?.seen ?? false,
      dto?.delete ?? false,
    );
  }

  @override
  String toString() {
    return '''
      id: $id
      type: $type
      title: $title
      message: $message
      time: $time,
      seen: $seen,
      delete: $delete,
    ''';
  }

  factory ItemNotifyEntity.fromJson(String str) =>
      ItemNotifyEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemNotifyEntity.fromMap(Map<String, dynamic> json) =>
      ItemNotifyEntity(
        json['id'],
        json['type'],
        json['title'],
        json['message'],
        json['time'],
        json['seen'],
        json['delete'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'type': type,
        'title': title,
        'message': message,
        'time': time,
        'seen': seen,
        'delete': delete,
      };
}
