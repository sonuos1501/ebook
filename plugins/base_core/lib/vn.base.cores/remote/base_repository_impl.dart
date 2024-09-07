import 'package:injectable/injectable.dart';

import 'api.dart';
import 'base_repository.dart';

@injectable
class BaseRepositoryImpl implements BaseRepository {
  final API api;

  @InjectableInit()
  BaseRepositoryImpl(this.api);
}
