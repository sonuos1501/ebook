import 'package:base_core/vn.base.cores/remote/api_impl.dart';

abstract class RemoteRepository {
  void login(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void register(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void sendOtp(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void resetPassword(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void getParentProfile(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void updateParentProfile(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void changeParentPassword(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void changeParentPasswordAfterReset(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void childrenByParent(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void createChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void deleteChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void updateChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void updateChildByParent(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void createDeviceByUser(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void getAppsForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void getTimeManagement(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void createTimeManagement(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void updateChangeAllWeek(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void updateChangeWeekdays(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void createAppForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void updateAppForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void updateAllAppForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void createListAppForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void createLinkForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void updateLinkForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void updateAppLog(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void loadAppLog(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void updateCountAppLog(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void getLinksForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void deleteLinkForChild(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void getVersionUpdate(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void logOut(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});

  void searchSchools(APIImpl apiImpl,
      {key = APIImpl.keyCommon, required Map<String, dynamic> body});
}
