// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:base_core/config.dart';
import 'package:base_core/vn.base.cores/common/storage.dart';
import 'package:base_core/vn.base.cores/res/resources.dart';
import 'package:base_core/vn.base.cores/utils/utils.dart';
import 'package:base_https/vn.base.https/gen/injection.dart';
// import 'package:chatbot/chatbot.dart';
import 'package:connectivity/connectivity.dart';
import 'package:ebook/routers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

import 'pages.dart';

BuildContext? mContext;

Future<void> main() async {
  const env = Environment.dev;
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await Device.initDeviceInfo();
  await Get.putAsync<StorageService>(() => StorageService().init());
  await dotenv.load(fileName: 'plugins/base_https/${_env(env)}');
  await initHiveForFlutter();
  await configureDependencies(env);

  EventBus.to.addListener(_logout, name: 'logout');
  await Firebase.initializeApp();
  // await ChatBot.init(env: env);
  runApp(const MyApp());
}

String _env(String env) {
  switch (env) {
    case Environment.dev:
      return '.env';
    case Environment.prod:
      return '.prod.env';
    case Environment.test:
      return '.stag.env';
    default:
      return '.env';
  }
}

void _logout(data) {
  print('logout event bus');
  if (!StorageService.to.getBool('RememberPassword')) {
    StorageService.to.remove('UsernameLogin');
    StorageService.to.remove('PasswordLogin');
  }
  StorageService.to.remove('parentProfile');
  StorageService.to.removeToken();
  StorageService.to.remove(Constant.keyFCMToken);
  //Get.offAllNamed(TechJARouters.login);
}

class MyApp extends StatefulWidget {
  final Widget? home;
  final ThemeData? theme;

  const MyApp({super.key, this.home, this.theme});

  @override
  _MyAppState createState() => _MyAppState();
}

bool isForeground = false;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late StreamSubscription<ConnectivityResult> _subscription;
  bool isUploadSuccess = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkNetwork();
    _subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          log('NETWORK is connected');
        } else {
          log('NETWORK is gone');
        }
        config.networkStateChanged(result);
      },
    );
    _initMethod();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _subscription.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    isForeground = false;
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        isForeground = true;
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      default:
    }
  }

  final ThemeData _theme = ThemeData(
    brightness: Brightness.dark,
    canvasColor: Colours.main,
    splashColor: Colours.transparent,
    indicatorColor: Colours.black,
    scaffoldBackgroundColor: Colours.main,
    visualDensity: VisualDensity.standard,
    fontFamily: 'Regular',
    highlightColor: Colours.transparent,
    appBarTheme: AppBarTheme(
      elevation: 8.0,
      color: Colours.main,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: Colours.main,
        statusBarColor: Colours.main,
        systemNavigationBarDividerColor: Colours.main,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    setDesignWHD(800, 1280);
    ScreenUtil.getInstance();

    mContext = context;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colours.transparent,
        systemNavigationBarDividerColor: Colours.main,
      ),
      child: GetMaterialApp(
        title: 'Sách điện tử',
        theme: _theme,
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false,
        initialRoute: Routers.root,
        initialBinding: InitialBinding(),
        builder: EasyLoading.init(),
      ),
    );
  }

  void _initMethod() {}

  void _checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    config.networkStateChanged(connectivityResult);
  }
}

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    Map<Permission, PermissionStatus> data = await [
      Permission.storage,
      Permission.camera,
      Permission.phone,
      Permission.mediaLibrary,
      Permission.requestInstallPackages,
    ].request();
    data.forEach((key, value) async {
      if (value == PermissionStatus.denied) {
        exit(0);
      }
    });
  }
}
