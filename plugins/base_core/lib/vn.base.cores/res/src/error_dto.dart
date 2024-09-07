class ErrorDto {
  String? message;
  String? code;

  ErrorDto({this.message, this.code});

  ErrorDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = '${json['code']}';
  }

  @override
  String toString() {
    return
      'code: $code, message: $message';
  }
}
