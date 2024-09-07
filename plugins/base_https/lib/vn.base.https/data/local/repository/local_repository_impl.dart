import 'dart:convert';

import 'package:database/vn.base.database/db/db_dao.dart';
import 'package:database/vn.base.database/db/entity/db_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:base_https/vn.base.https/data/dto/notification_dto.dart';
import 'package:base_https/vn.base.https/domain/model/notification_entity.dart';
import 'package:base_https/vn.base.https/domain/repository/local_repository.dart';

@injectable
class LocalRepositoryImpl implements LocalTopicsRepository {
  final DBDao dbDao;

  @InjectableInit()
  LocalRepositoryImpl(this.dbDao);

  @override
  Future<NotificationDto?> listNotifies() async {
    final List<dynamic> data = await dbDao.getNotifies();
    if (data.isEmpty) return null;
    print('listNotifies DB: ${data[0]['data']}');
    final rs = NotificationDto(
      title: 'TechJA DB notification',
      notifies: data.map((e) => ItemNotifyDto.fromJson(e['data'])).toList(),
      msg: 'List Notification',
      code: 200,
    );
    return Future(() => rs);
  }

  @override
  Future<void> addNotify(ItemNotifyEntity notify) async {
    dbDao.replaceData(DBEntity('/notify/${notify.id}', json.encode(notify)));
  }
}
