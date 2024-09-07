part of utils;

void traceError(void body) {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (!Constant.inProduction) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };

  runZonedGuarded(() => body, (Object error, StackTrace stackTrace) async {
    await _reportError(error, stackTrace);
  }, zoneValues: {}, zoneSpecification: const ZoneSpecification());
}

Future<void> _reportError(Object error, StackTrace stackTrace) async {
  if (!Constant.inProduction) {
    debugPrintStack(
      stackTrace: stackTrace,
      label: error.toString(),
      maxFrames: 100,
    );
  }
}
