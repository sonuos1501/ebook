import 'package:base_core/vn.base.cores/common/config.dart';
import 'package:base_core/vn.base.cores/common/resource.dart';
import 'package:base_core/vn.base.cores/domain/usecase/base_api_usecase.dart';
import 'package:base_core/vn.base.cores/remote/api_impl.dart' as api;
import 'package:injectable/injectable.dart';
import 'package:base_https/vn.base.https/data/dto/version_dto.dart';
import 'package:base_https/vn.base.https/domain/model/version_entity.dart';

import '../repository/remote_repository.dart';

@injectable
class DeviceUseCase extends BaseAPIUseCase {
  final RemoteRepository remoteRepo;

  @InjectableInit()
  DeviceUseCase(this.remoteRepo);

  void getVersionUpdate(Map<String, dynamic> body, Function(Object) callBack) {
    execAPI(callBack, () {
      remoteRepo.getVersionUpdate(
        api.APIImpl((data) {
          handleBack(callBack, data, success: (dataSuccess) {
            logger.i('getVersionUpdate success = ' + dataSuccess.toString());
            final rs = dataSuccess as api.SuccessAPI;
            VersionDto dto = rs.data as VersionDto;
            final data = VersionEntity.toEntity(dto);
            callBack(Success(data));
          });
        }),
        body: body,
      );
    });
  }
}
