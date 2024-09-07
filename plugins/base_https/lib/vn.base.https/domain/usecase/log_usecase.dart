import 'package:base_core/vn.base.cores/common/config.dart';
import 'package:base_core/vn.base.cores/common/resource.dart';
import 'package:base_core/vn.base.cores/domain/usecase/base_api_usecase.dart';
import 'package:base_core/vn.base.cores/remote/api_impl.dart' as api;
import 'package:injectable/injectable.dart';
import 'package:base_https/vn.base.https/data/dto/app_log_dto.dart';
import 'package:base_https/vn.base.https/domain/model/app_log_entity.dart';
import 'package:base_https/vn.base.https/domain/repository/remote_repository.dart';

@injectable
class LogUseCase extends BaseAPIUseCase {
  final RemoteRepository remoteRepo;

  @InjectableInit()
  LogUseCase(this.remoteRepo);

  void updateAppLog(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.updateAppLog(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i('updateAppLog success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            bool isOK = response.data as bool;
            callback(Success(isOK));
          });
        }),
        body: body,
      );
    });
  }

  void updateCountAppLog(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.updateCountAppLog(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i(
                'countManyAppLogByChild success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            bool isOK = response.data as bool;
            callback(Success(isOK));
          });
        }),
        body: body,
      );
    });
  }

  void loadAppLog(Map<String, dynamic> body, Function(Object) callback) {
    print('NEON: body = $body');
    execAPI(callback, () {
      remoteRepo.loadAppLog(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i('loadAppLog success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            List<AppLogDto> dto = response.data as List<AppLogDto>;
            var data = dto.map((e) => AppLogEntity.toEntity(e)).toList();
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }
}
