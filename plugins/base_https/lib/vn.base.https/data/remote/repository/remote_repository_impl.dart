import 'package:base_core/vn.base.cores/remote/api_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:base_https/vn.base.https/data/remote/app_api.dart';
import 'package:base_https/vn.base.https/domain/repository/remote_repository.dart';

@injectable
class RemoteRepositoryImpl implements RemoteRepository {
  final AppAPI api;

  @InjectableInit()
  RemoteRepositoryImpl(this.api);

  @override
  void login(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) async {
    return apiImpl.execApiTask(api.login(body), key);
  }

  @override
  void register(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) async {
    return apiImpl.execApiTask(api.register(body), key);
  }

  @override
  void sendOtp(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) async {
    return apiImpl.execApiTask(api.sendOtp(body), key);
  }

  @override
  void resetPassword(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) async {
    return apiImpl.execApiTask(api.resetPassword(body), key);
  }

  @override
  void getParentProfile(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.getParentProfile(body), key);
  }

  @override
  void updateParentProfile(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.updateParentProfile(body), key);
  }

  @override
  void changeParentPassword(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.changeParentPassword(body), key);
  }

  void childrenByParent(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.childrenByParent(body), key);
  }

  @override
  void createChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.createChild(body), key);
  }

  @override
  void deleteChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.deleteChild(body), key);
  }

  @override
  void updateChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.updateChild(body), key);
  }

  @override
  void updateChildByParent(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.updateChildByParent(body), key);
  }

  @override
  void createDeviceByUser(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.createDeviceByUser(body), key);
  }

  @override
  void getAppsForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.appByChild(body), key);
  }

  @override
  void getTimeManagement(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.getTimeManagement(body), key);
  }

  @override
  void createTimeManagement(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.createTimeManagement(body), key);
  }

  @override
  void createAppForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.createAppForChild(body), key);
  }

  @override
  void updateChangeAllWeek(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.updateChangeAllWeek(body), key);
  }

  @override
  void updateChangeWeekdays(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.updateChangeWeekdays(body), key);
  }

  @override
  void updateAppForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.updateAppForChild(body), key);
  }

  @override
  void updateAllAppForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.updateAllAppForChild(body), key);
  }

  @override
  void createListAppForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.createListAppAppForChild(body), key);
  }

  @override
  void createLinkForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.createLinkForChild(body), key);
  }

  @override
  void updateLinkForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.updateLinkForChild(body), key);
  }

  @override
  void updateAppLog(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.updateAppLog(body), key);
  }

  @override
  void loadAppLog(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.loadAppLog(body), key);
  }

  @override
  void updateCountAppLog(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.updateCountAppLog(body), key);
  }

  @override
  void getLinksForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.getLinksForChild(body), key);
  }

  @override
  void deleteLinkForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.deleteLinkForChild(body), key);
  }

  @override
  void getVersionUpdate(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.getVersionUpdate(body), key);
  }

  @override
  void changeParentPasswordAfterReset(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.changeParentPasswordAfterReset(body), key);
  }

  @override
  void logOut(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.logOut(body), key);
  }

  @override
  void searchSchools(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body}) {
    return apiImpl.execApiTask(api.searchSchools(body), key);
  }
}
