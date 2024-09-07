part of utils;

bool isPhone(String text) {
  RegExp regExp = RegExp(
    '^(09|03|07|08|05)\\d{8}\$',
    caseSensitive: false,
    multiLine: false,
  );
  return regExp.hasMatch(text);
}

bool isNumeric(String str) {
  RegExp _numeric = RegExp(r'^-?[0-9]+$');
  return _numeric.hasMatch(str);
}

bool isValidEmail(String email) {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isValidPassword(String pwd) {
  return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
      .hasMatch(pwd);
}
