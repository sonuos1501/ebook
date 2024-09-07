part of appcommon;

class EventBus {
  static EventBus get instance => _getInstance();

  static EventBus? _instance;

  EventBus._internal();

  static EventBus _getInstance() {
    if (_instance == null) {
      _instance = EventBus._internal();
    }
    return _instance!;
  }

  Map<String, List<void Function(dynamic)>> _listener = {};

  void addListener(void Function(dynamic) fn, {String? name}) async {
    if (name == null || name.isEmpty) {
      var dl = _listener[defaultNotification];
      if (dl == null || dl.length == 0) {
        _listener[defaultNotification] = [fn];
      } else {
        _listener[defaultNotification] = dl..add(fn);
      }
    } else {
      var otherLst = _listener[name];
      if (otherLst == null || otherLst.length == 0) {
        _listener[name] = [fn];
      } else {
        _listener[name] = otherLst..add(fn);
      }
    }
  }

  void notificationListener({String? name, dynamic parameter}) {
    if (name == null || name.isEmpty) {
      var dl = _listener[defaultNotification];
      if (dl != null) {
        dl.forEach((fn) {
          fn(parameter);
        });
      }
    } else {
      var dl = _listener[name];
      if (dl != null) {
        dl.forEach((fn) {
          fn(parameter);
        });
      }
    }
  }

  void removeListener(void Function(dynamic) fn, {String? name}) {
    if (name == null || name.isEmpty) {
      _listener[defaultNotification]?.remove(fn);
    } else {
      _listener[name]?.remove(fn);
    }
  }

  /// 移除所有监听
  void removeAllListener() {
    _listener.clear();
  }
}

/// 默认监听
const String defaultNotification = 'defaultNotification';
