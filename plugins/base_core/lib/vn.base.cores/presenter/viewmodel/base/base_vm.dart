import 'dart:convert';

import 'package:get/get.dart';

import '../../../common/resource.dart';
import '../../../res/resources.dart';
import '../../../res/src/error_dto.dart';

abstract class BaseViewModel extends GetxController
    with GetTickerProviderStateMixin {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

handleError(event, callBack) {
  print('base - handleError callBack: ${event}');
  if (event is Notify || event is Failed) {
    final txt = (event as Resource).msg ?? Constant.systemErrorMsg;
    try {
      final errorDto = ErrorDto.fromJson(json.decode(txt));
      print('base - handleError: ${errorDto.message}');
      callBack(errorDto.message!);
    } catch (e) {
      print('base - handleError cast ErrorDto: ${e}');
      callBack(
          ErrorDto.fromJson(json.decode(Constant.systemErrorMsg)).message!);
    }
  }
}
