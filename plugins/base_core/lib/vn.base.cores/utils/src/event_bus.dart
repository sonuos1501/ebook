part of '../utils.dart';

class EventBus {
  static EventBus get to => _getInstance();
  static EventBus? _to;
  final Map<String, List<void Function(dynamic)>> _listener = {};

  EventBus._internal();

  static EventBus _getInstance() {
    _to ??= EventBus._internal();
    return _to!;
  }

  void addListener(void Function(dynamic) fn, {String? name}) async {
    if (name == null || name.isEmpty) {
      var dl = _listener[defaultNotification];
      if (dl == null || dl.isEmpty) {
        _listener[defaultNotification] = [fn];
      } else {
        _listener[defaultNotification] = dl..add(fn);
      }
    } else {
      var otherLst = _listener[name];
      if (otherLst == null || otherLst.isEmpty) {
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
        for (var fn in dl) {
          fn(parameter);
        }
      }
    } else {
      var dl = _listener[name];
      if (dl != null) {
        for (var fn in dl) {
          fn(parameter);
        }
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

  void removeAllListenerByName({String? name}) {
    if (name == null || name.isEmpty) {
      _listener[defaultNotification]?.clear();
    } else {
      _listener[name]?.clear();
    }
  }

  void removeAllListener() {
    _listener.clear();
  }
}

const String defaultNotification = 'defaultNotification';
const String checkTimeNotification = 'checkTimeNotification';
const String appUsageNotification = 'appUsageNotification';
