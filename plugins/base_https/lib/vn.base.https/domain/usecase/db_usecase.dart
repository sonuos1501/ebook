import 'dart:async';
import 'dart:io';

import 'package:base_core/vn.base.cores/common/resource.dart';
import 'package:injectable/injectable.dart';
import 'package:base_https/vn.base.https/domain/model/notification_entity.dart';

import '../repository/local_repository.dart';

@injectable
class DBUseCase {
  final LocalTopicsRepository localRepo;

  @InjectableInit()
  DBUseCase(this.localRepo);

  StreamController controller = StreamController<Resource<bool>>();

  Stream get resourceStream => controller.stream;

  Stream<Resource<bool>> addNotification(ItemNotifyEntity notifyEntity) async* {
    try {
      controller.sink.add(Loading());
      localRepo.addNotify(notifyEntity);
      controller.sink.add(Success(true));
    } on RedirectException catch (e) {
      controller.sink.add(Failed(e, e.redirects[0].statusCode));
    } catch (e) {
      controller.sink.add(Exception(e));
    }
  }
}
