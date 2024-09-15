// ignore_for_file: depend_on_referenced_packages

import 'package:base_core/vn.base.cores/utils/utils.dart';
import 'package:device_info_plus/device_info_plus.dart';

late String imei;

void getImei() {
  sendToNative(key: 'key_get_device_imei');
}

Future<Map<String, dynamic>> getDeviceInfo(imei) async {
  print('getDeviceInfo...');
  var allInfo = _readAndroidBuildData(await DeviceInfoPlugin().androidInfo);
  String deviceId = allInfo['deviceId'];
  String deviceName = allInfo['model'];
  String deviceModel = allInfo['id'];
  String deviceOs = 'Android ${allInfo['sdkInt']}';
  print('${[imei]}');
  var param = {
    'deviceId': deviceId,
    'deviceName': deviceName,
    'osVersion': deviceOs,
    'platform': 'Android',
    'deviceModel': deviceModel,
    'imei': [imei],
  };
  return param;
}

Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  return <String, dynamic>{
    'version.securityPatch': build.version.securityPatch,
    'version.sdkInt': build.version.sdkInt,
    'version.release': build.version.release,
    'version.previewSdkInt': build.version.previewSdkInt,
    'version.incremental': build.version.incremental,
    'version.codename': build.version.codename,
    'version.baseOS': build.version.baseOS,
    'board': build.board,
    'bootloader': build.bootloader,
    'brand': build.brand,
    'device': build.device,
    'display': build.display,
    'fingerprint': build.fingerprint,
    'hardware': build.hardware,
    'host': build.host,
    'id': build.id,
    'manufacturer': build.manufacturer,
    'model': build.model,
    'product': build.product,
    'supported32BitAbis': build.supported32BitAbis,
    'supported64BitAbis': build.supported64BitAbis,
    'supportedAbis': build.supportedAbis,
    'tags': build.tags,
    'type': build.type,
    'isPhysicalDevice': build.isPhysicalDevice,
    'systemFeatures': build.systemFeatures,
    'deviceId': build.id,
  };
}
