import 'package:base_core/vn.base.cores/common/config.dart';
import 'package:base_core/vn.base.cores/common/resource.dart';
import 'package:base_core/vn.base.cores/domain/usecase/base_api_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:base_https/vn.base.https/data/dto/link_dto.dart';
import 'package:base_https/vn.base.https/domain/model/link_entity.dart';
import 'package:base_https/vn.base.https/domain/repository/local_repository.dart';
import 'package:base_https/vn.base.https/domain/repository/remote_repository.dart';
import 'package:base_core/vn.base.cores/remote/api_impl.dart' as api;

@injectable
class LinkUseCase extends BaseAPIUseCase {
  final LocalTopicsRepository localRepo;
  final RemoteRepository remoteRepo;

  @InjectableInit()
  LinkUseCase(this.localRepo, this.remoteRepo);

  void createLinkForChild(
      Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.createLinkForChild(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger
                .i('Create link for child success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            LinkDto dto = response.data as LinkDto;
            final data = LinkEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void updateLinkForChild(
      Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.updateLinkForChild(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger
                .i('Update link for child success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            int count = response.data as int;
            callback(Success(count));
          });
        }),
        body: body,
      );
    });
  }

  void getLinksForChild(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.getLinksForChild(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i(
                'Get list link for child success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            List<LinkDto> dto = response.data as List<LinkDto>;
            var data = dto.map((e) => LinkEntity.toEntity(e)).toList();
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void deleteLinkForChild(
      Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.deleteLinkForChild(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger
                .i('Delete link for child success = ' + dataSuccess.toString());
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
