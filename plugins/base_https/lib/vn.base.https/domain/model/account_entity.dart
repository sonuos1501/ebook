import 'package:base_https/vn.base.https/data/dto/account_dto.dart';

class AccountEntity {
  final String token;
  final String refreshToken;

  AccountEntity(this.token, this.refreshToken);

  static toEntity(AccountDto dto) {
    return AccountEntity(dto.accessToken ?? 'N/A', dto.refreshToken ?? 'N/A');
  }
}
