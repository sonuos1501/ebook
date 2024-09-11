// ignore_for_file: avoid_print
import 'package:ebook/vn.app.common/presenter/loading.dart';

import '../res/colors.dart';
import 'viewmodel/base/base_vm.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:synchronized/synchronized.dart' as sync;

late AppLifecycleState stateApp;

abstract class ScreenCommonState<T extends StatefulWidget,
        V extends BaseViewModel> extends State<T>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  late bool useMobileLayout;
  late StreamSubscription<ConnectivityResult> subscription;
  Object? data;
  late V vm;
  var isShow = false;
  var isCheckingTime = false;

  @override
  bool get wantKeepAlive => true;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    initViewModel();
    vm = Get.find<V>();

    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorItem.colorBlueDark,
    ));
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      _handleNetworkChange(result);
    });
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    log('didUpdateWidget...');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    stateApp = state;
    log('Last notification: $stateApp');
    if (stateApp == AppLifecycleState.resumed) {
      //do nothing
    }
  }

  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    subscription.cancel();
  }

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);

    var smallestDimension = MediaQuery.of(context).size.shortestSide;
    useMobileLayout = smallestDimension < 600;
    data = ModalRoute.of(context)?.settings.arguments;
    var height = MediaQuery.of(context).padding.top;
    return GetBuilder<V>(
      init: vm,
      builder: (controller) {
        return Container(
          color: const Color(0x64000000),
          child: Stack(children: [
            initWidget(context, height),
            loading(isShow),
          ]),
        );
      },
    );
  }

  @protected
  Widget initWidget(BuildContext context, double topHeight);

  void showLoading() {
    isShow = true;
    vm.update();
  }

  void hideLoading() {
    isShow = false;
    vm.update();
  }

  final _lock = sync.Lock();

  _handleNetworkChange(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      await _lock.synchronized(() async {
        //do nothing
      });
    }
  }

  void log(msg) {
    if (kDebugMode) {
      print(msg);
    }
  }

  void initViewModel();

  void handleNotify(Object msg) {
    if (msg is String) {
      Fluttertoast.showToast(
        gravity: ToastGravity.CENTER,
        msg: msg,
      );
    }
    //showToast(event.msg);
    //toastWithBorder((event as Resource).msg, mContext);
  }

  void doLogOut(Widget item) async {
    // var isDeviceActive = StorageService.to.getBool(Constants.DEVICE_ACTIVATED);
    // var preFillEmail = StorageService.to.getString(Constants.PREFILL_EMAIL);
    // StorageService.to.clear();
    // StorageService.to.setBool(Constants.DEVICE_ACTIVATED, isDeviceActive);
    // if (preFillEmail != null && preFillEmail.isNotEmpty) {
    //   StorageService.to.setString(Constants.PREFILL_EMAIL, preFillEmail);
    // }
    // logParentEventView(baseRouters.login, 'Login screen');
    // logScreenView(baseRouters.login, 'Login screen');
    // Get.offAndToNamed(baseRouters.login);
  }
}
