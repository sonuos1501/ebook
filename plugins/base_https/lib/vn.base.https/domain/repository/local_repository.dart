import 'package:base_https/vn.base.https/domain/model/notification_entity.dart';
import '../../data/dto/notification_dto.dart';

abstract class LocalTopicsRepository {
  Future<NotificationDto?> listNotifies();
  Future<void> addNotify(ItemNotifyEntity notify);
}
