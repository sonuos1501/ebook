import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../common/resource.dart';
import '../../remote/api_impl.dart';

abstract class BaseAPIUseCase {
  handleBack(callback, data, {notify, success, error}) {
    debugPrint('SON - handleBack: $data');
    if (data is ErrorAPI) {
      if (error != null) {
        debugPrint('SON - error: $data');
        error(data);
      } else {
        debugPrint('SON - handleError: $data');
        handleError(callback, data);
      }
    } else {
      if (success != null) {
        success(data);
      } else {
        handleSuccess(callback, data);
      }
    }
  }

  handleNotify(callback, Set<String?> msg) {
    callback(Notify(msg));
  }

  handleError(callback, data) {
    final error = data as ErrorAPI;
    debugPrint('SON - error.type: ${error.type}');
    switch (error.type) {
      case ErrorAPI.typeNetwork:
      case ErrorAPI.typeExpiredToken:
      case ErrorAPI.typeMsg:
      case ErrorAPI.typeMsgEx:
      case ErrorAPI.typeResNull:
      case ErrorAPI.typeSystem:
        callback(Notify(error.data?.toString()));
        debugPrint('SON - Notify: ${error.data?.toString()}');
        return;
    }
    callback(Failed(error.data, error.type, key: error.key));
  }

  handleSuccess(callback, data) {
    final success = data as SuccessAPI;
    callback(Success(success.data));
  }

  execAPI(callback, exec, {loading, fail, exception}) {
    try {
      if (loading != null) {
        loading();
      } else {
        callback(Loading());
      }
      exec();
    } on RedirectException catch (e) {
      if (fail != null) {
        fail(e);
      } else {
        callback(
            Failed(e, e.redirects[0].statusCode, key: 'RedirectException'));
      }
    } catch (e) {
      if (exception != null) {
        exception(e);
      } else {
        callback(Exception(e));
      }
    }
  }
}
