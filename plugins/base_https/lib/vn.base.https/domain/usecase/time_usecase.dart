import 'package:base_core/vn.base.cores/common/config.dart';
import 'package:base_core/vn.base.cores/common/resource.dart';
import 'package:base_core/vn.base.cores/domain/usecase/base_api_usecase.dart';
import 'package:base_core/vn.base.cores/remote/api_impl.dart' as api;
import 'package:injectable/injectable.dart';
import 'package:base_https/vn.base.https/data/dto/time_dto.dart';
import 'package:base_https/vn.base.https/domain/repository/remote_repository.dart';

import '../model/time_entity.dart';

@injectable
class TimeUseCase extends BaseAPIUseCase {
  final RemoteRepository remoteRepo;

  @InjectableInit()
  TimeUseCase(this.remoteRepo);
  final _WEEKDAYS_POS = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
      .asMap()
      .map((ind, day) => MapEntry(day, ind));

  void getTimeManagement(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.getTimeManagement(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i('Get time management success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            TimeDto dto = response.data as TimeDto;
            dto.weekdays?.sort(
              (first, second) {
                final firstPos = _WEEKDAYS_POS[first.name] ?? 8;
                final secondPos = _WEEKDAYS_POS[second.name] ?? 8;
                return firstPos.compareTo(secondPos);
              },
            );

            final data = TimeEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void createTimeManagement(
      Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.createTimeManagement(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i(
                'Create time management success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            TimeDto dto = response.data as TimeDto;
            final data = TimeEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void updateChangeAllWeek(
      Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.updateChangeAllWeek(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i(
                'Update time management success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            TimeDto dto = response.data as TimeDto;
            final data = TimeEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void updateChangeWeekdays(
      Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.updateChangeWeekdays(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i(
                'Update time management success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            TimeDto dto = response.data as TimeDto;
            final data = TimeEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }
}
