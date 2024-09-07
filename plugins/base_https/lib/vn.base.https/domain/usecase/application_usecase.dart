import 'package:base_core/vn.base.cores/common/config.dart';
import 'package:base_core/vn.base.cores/common/resource.dart';
import 'package:base_core/vn.base.cores/domain/usecase/base_api_usecase.dart';
import 'package:base_core/vn.base.cores/remote/api_impl.dart' as api;
import 'package:injectable/injectable.dart';
import 'package:base_https/vn.base.https/data/dto/application_dto.dart';
import 'package:base_https/vn.base.https/domain/model/application_entity.dart';
import 'package:base_https/vn.base.https/domain/repository/remote_repository.dart';

import '../repository/local_repository.dart';

@injectable
class ApplicationUseCase extends BaseAPIUseCase {
  final LocalTopicsRepository localRepo;
  final RemoteRepository remoteRepo;

  @InjectableInit()
  ApplicationUseCase(this.localRepo, this.remoteRepo);

  void createAppForChild(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.createAppForChild(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger
                .i('Create app for child success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            ApplicationDto dto = response.data as ApplicationDto;
            final data = ApplicationEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void updateAppForChild(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.updateAppForChild(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger
                .i('Update app for child success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            int count = response.data as int;
            callback(Success(count));
          });
        }),
        body: body,
      );
    });
  }

  void getListAppForChild(
      Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.getAppsForChild(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i(
                'Get list apps for child success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            List<ApplicationDto> dto = response.data as List<ApplicationDto>;
            var data = dto.map((e) => ApplicationEntity.toEntity(e)).toList();
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void updateAllAppForChild(
      Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.updateAllAppForChild(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i(
                'Update all app for child success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            int count = response.data as int;
            callback(Success(count));
          });
        }),
        body: body,
      );
    });
  }

  void createListAppForChild(
      Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.createListAppForChild(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i('Create list app for child success = ' +
                dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            int count = response.data as int;
            callback(Success(count));
          });
        }),
        body: body,
      );
    });
  }
}
