import 'dart:async';
import 'dart:ui';

import 'package:base_core/vn.base.cores/common/config.dart';
import 'package:connectivity/connectivity.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class APIImpl {
  final apiFetcher = StreamController<Object>();
  static const String keyCommon = 'KEY_COMMON';

  Stream<Object> get apiStream => apiFetcher.stream;

  APIImpl(handle) {
    apiStream.listen((event) => handle(event));
  }

  void execApiCommon(Future<Object> exe, {VoidCallback? refreshToken}) async {
    execApiTask(exe, keyCommon);
  }

  void execApiTask(Future<Object> exe, String key) async {
    if (!await isNetworkOn()) {
      apiFetcher.sink.add(ErrorAPI(
          type: ErrorAPI.typeNetwork, data: ErrorAPI.netWorkError, key: key));
    } else {
      exe.then((it) {
        handleSuccess(key, it);
      }).catchError((Object obj) {
        handleErrorAPI(obj, key);
      });
    }
  }

  handleSuccess(String key, Object it) {
    logger.e('base  - Object : $it');
    apiFetcher.sink.add(SuccessAPI(key: key, data: it));
  }

  void handleErrorAPI(Object obj, String key) {
    if (obj is OperationException) {
      commonErrorAPI(obj, key);
    } else {
      logger.e('base - Something when wrong! no Dio, $obj');
      apiFetcher.sink.add(
          ErrorAPI(type: ErrorAPI.typeSystem, data: obj.toString(), key: key));
    }
  }

  void commonErrorAPI(OperationException error, String key) async {
    Object? res = error.linkException;
    if (error.graphqlErrors.length != 0) {
      res = error.graphqlErrors[0].message;
    }

    try {
      if (res is HttpLinkServerException) {
        Map<String, dynamic> error = {
          '\"code\"': res.parsedResponse?.response['statusCode'],
          '\"message\"':
              '\"${res.parsedResponse?.response['errors'][0]['message']}\"'
        };

        logger.e(
            'base - HttpLinkServerException: ${error.toString()} parse msg fail, $res');
        apiFetcher.sink
            .add(ErrorAPI(type: ErrorAPI.typeMsg, data: error, key: key));
        return;
      }
      apiFetcher.sink
          .add(ErrorAPI(type: ErrorAPI.typeMsg, data: res, key: key));
    } on Exception catch (f) {
      logger.e(
          'base - commonErrorAPI: Exception: ${ErrorAPI.systemError} parse msg fail, $res');
      apiFetcher.sink.add(
          ErrorAPI(type: ErrorAPI.typeMsgEx, data: f.toString(), key: key));
    }
  }

  dispose() {
    apiFetcher.close();
  }

  void execApiMockTask(String key,
      {bool isSuccess = true, required Object data}) async {
    if (!await isNetworkOn()) {
      apiFetcher.sink.add(ErrorAPI(
          type: ErrorAPI.typeNetwork, data: ErrorAPI.netWorkError, key: key));
    } else {
      if (isSuccess) {
        handleSuccess(key, data);
      } else {
        handleErrorAPI(data, key);
      }
    }
  }
}

Future<bool> isNetworkOn() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  bool connectedToWifi = (connectivityResult == ConnectivityResult.wifi);
  bool connectedToMobile = (connectivityResult == ConnectivityResult.mobile);
  return connectedToWifi || connectedToMobile;
}

class SuccessAPI {
  final String key;
  Object? data;

  SuccessAPI({required this.key, this.data});
}

class ErrorAPI {
  static const systemError = 'Something when wrong! null error';
  static const netWorkError = 'Network error';
  static const tokenExpired = 'Token is expired';

  static const int typeSystem = 999;
  static const int typeResNull = 997;
  static const int typeDataErrNull = 996;
  static const int typeMsg = 995;
  static const int typeMsgEx = 994;
  static const int typeNetwork = 993;
  static const int typeExpiredToken = 992;
  final String key;
  final int type;
  Object? data;

  ErrorAPI({required this.type, this.data, required this.key});
}
