import 'package:base_https/vn.base.https/data/dto/msg_dto.dart';

class MsgEntity {
  final String msg;
  final int code;

  MsgEntity(this.msg, this.code);

  static toEntity(MsgDto dto) {
    return MsgEntity(dto.msg ?? 'N/A', dto.code ?? -1);
  }
}
