import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'network.dart';

var config = _Config._();

class _Config {
  String get registerLink => '';

  _Config._();
  final timeAttendance = 15; //minute
  final percentTimeTeaching = 85; //% (percentage)
  var mode = '';
  var state = Rx<AuthState>(AuthUninitialized());

  get language => 'vi';

  bool networkError() {
    final rs = state.value.netState.value != NetState.ready ||
        state.value.result.value == ConnectivityResult.none;
    debugPrint('SON networkError = $rs');
    return rs;
  }

  void netStateChanged(NetState state) {
    this.state.value.netState.value = state;
  }

  void networkStateChanged(ConnectivityResult state) {
    this.state.value.result.value = state;
  }
}

abstract class AuthState {
  late BuildContext context;
  Rx<NetState> netState = NetState.ready.obs;
  Rx<ConnectivityResult> result = ConnectivityResult.none.obs;
}

class AuthUninitialized extends AuthState {
  // late BuildContext context;
}
