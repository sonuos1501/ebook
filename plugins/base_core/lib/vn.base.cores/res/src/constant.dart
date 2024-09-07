part of resources;

class Constant {
  static const bool inProduction = kReleaseMode;

  static bool isDriverTest = true;
  static int across = 1;
  static int vertical = 2;

  static const String systemErrorMsg =
      '{\"code\":\"vn.basepia.tutor.parent.exception.InvalidUsernameOrPasswordException\",\"message\":\"Có lỗi hệ thống, vui lòng thử lại sau!\"}';
  static const String keyFCMToken = 'keyFCMToken';
  static const String keyRefreshToken = 'keyRefreshToken';
  static const String loginOut = '/loginOut';
  static const String userId = '/userId';
  static const String firstOrigin = '/firstOrigin';
  static const String firstEnter = '/firstEnter';
}
