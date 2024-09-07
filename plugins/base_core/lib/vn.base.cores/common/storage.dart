import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  static const keyCurrentStudentId = 'keyCurrentStudentId';
  static const keyDurationUsages = 'keyDurationUsages';
  static const keyStartCountTime = 'keyStartCountTime';
  static const keyCountTimesUsages = 'keyCountTimesUsages';
  static const keyTypeTime = 'keyTypeTime';
  static const keyListAccount = 'keyListAccount';
  static const keyListWeb = 'keyListWeb';
  static const keyToken = 'keyToken';
  static const keyRefreshToken = 'keyRefreshToken';
  static const keyDeviceId = 'keyDeviceId';
  static const keyPackageName = 'keyPackageName';
  static const keyReportDailyDataStudent = 'keyReportDailyDataStudent';
  static const keyReportWeeklyDataStudent = 'keyReportWeeklyDataStudent';
  static const keyReportMonthlyDataStudent = 'keyReportMonthlyDataStudent';
  static const keyEnableAppStudent = 'keyEnableAppStudent';
  static const keyDisEnableAppStudent = 'keyDisEnableAppStudent';
  static const keyAppParent = 'keyAppParent';

  static StorageService get to => Get.find();
  static Future<String?> getTokenBG() async {
    final storage = await StorageService().init();
    return storage.getToken();
  }

  late final SharedPreferences _prefs;
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> setToken({required String userToken}) async {
    await _prefs.setString(keyToken, userToken);
  }

  Future<void> setRefreshToken({required String refreshToken}) async {
    await _prefs.setString(keyRefreshToken, refreshToken);
  }

  String? getToken() {
    final userToken = _prefs.getString(keyToken);
    return userToken;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  List<String> getList(String key, {List<String>? defaultValue}) {
    return _prefs.getStringList(key) ?? defaultValue ?? [];
  }

  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  void removeToken() async {
    await _prefs.remove(keyToken);
    await _prefs.remove(keyRefreshToken);
  }

  Future<bool> clear() async {
    return await _prefs.clear();
  }

  String getRefreshToken() {
    return StorageService.to.getString(keyRefreshToken) ?? 'N/A';
  }

  Future<void> reload() async {
    await _prefs.reload();
  }
}
