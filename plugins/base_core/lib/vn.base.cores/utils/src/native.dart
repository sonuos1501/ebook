part of utils;

Future<Res> sendToNative({key, data}) async {
  Req request = Req()
    ..key = key
    ..data = data;
  ReqApi api = ReqApi();
  Res reply = await api.request(request);
  print('reply-key: ${reply.key}');
  print('reply-data: ${reply.data}');
  return reply;
}
//Ex: sendToNative(key: keyOpenWebView, data: {"link": item.src, "id": "123"});
