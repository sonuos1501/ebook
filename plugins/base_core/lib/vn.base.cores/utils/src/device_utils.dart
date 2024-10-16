part of '../utils.dart';

/// https://medium.com/gskinner-team/flutter-simplify-platform-screen-size-detection-4cb6fc4f7ed1
class Device {
  static bool get isDesktop => !isWeb && (isWindows || isLinux || isMacOS);
  static bool get isMobile => isAndroid || isIOS;
  static bool get isWeb => kIsWeb;

  static bool get isWindows => !isWeb && Platform.isWindows;
  static bool get isLinux => !isWeb && Platform.isLinux;
  static bool get isMacOS => !isWeb && Platform.isMacOS;
  static bool get isAndroid => !isWeb && Platform.isAndroid;
  static bool get isFuchsia => !isWeb && Platform.isFuchsia;
  static bool get isIOS => !isWeb && Platform.isIOS;

  static late AndroidDeviceInfo _androidInfo;
  static late IosDeviceInfo _iosInfo;

  static Future<void> initDeviceInfo() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (isAndroid) {
      _androidInfo = await deviceInfo.androidInfo;
    } else {
      _iosInfo = await deviceInfo.iosInfo;
    }
  }

  /// 使用前记得初始化
  static int getAndroidSdkInt() {
    if (Constant.isDriverTest) {
      return -1;
    }
    if (isAndroid) {
      return _androidInfo.version.sdkInt;
    } else {
      return -1;
    }
  }

  static String infos() {
    if (Constant.isDriverTest) {
      return '';
    }
    if (isAndroid) {
      return '${_androidInfo.fingerprint}/${_androidInfo.id}';
    } else {
      return _iosInfo.utsname.machine!;
    }
  }

  static String brand() {
    if (Constant.isDriverTest) {
      return '';
    }
    if (isAndroid) {
      return _androidInfo.brand;
    } else {
      return _iosInfo.name!;
    }
  }

  static AndroidDeviceInfo android() {
    return _androidInfo;
  }

  static IosDeviceInfo ios() {
    return _iosInfo;
  }
}
