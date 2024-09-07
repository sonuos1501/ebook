import 'package:base_core/vn.base.cores/domain/usecase/base_api_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:base_https/vn.base.https/domain/repository/remote_repository.dart';

@injectable
class StudentUseCase extends BaseAPIUseCase {
  final RemoteRepository remoteRepo;

  @InjectableInit()
  StudentUseCase(this.remoteRepo);
}
