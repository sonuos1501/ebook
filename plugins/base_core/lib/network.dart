library network;

// Connection Types
enum ConnectionType {
  webSocket,
  tcp,
  kcp,
}

enum NetState {
  connecting,
  ready,
  closing,
  closed,
}

enum ConfuseType {
  aesCtr,
}

// Events
typedef OnMessageEvent = void Function(List<int> data);
typedef OnClosed = void Function();
typedef OnInitialized = void Function();
