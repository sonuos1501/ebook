import 'package:base_core/vn.base.cores/common/config.dart';
import 'package:base_core/vn.base.cores/common/resource.dart';
import 'package:base_core/vn.base.cores/domain/usecase/base_api_usecase.dart';
import 'package:base_core/vn.base.cores/remote/api_impl.dart' as api;
import 'package:injectable/injectable.dart';
import 'package:base_https/vn.base.https/data/dto/account_dto.dart';
import 'package:base_https/vn.base.https/data/dto/change_password_after_reset_dto.dart';
import 'package:base_https/vn.base.https/data/dto/create_device_by_user_dto.dart';
import 'package:base_https/vn.base.https/data/dto/logout_dto.dart';
import 'package:base_https/vn.base.https/data/dto/parent_profile_dto.dart';
import 'package:base_https/vn.base.https/data/dto/register_dto.dart';
import 'package:base_https/vn.base.https/data/dto/reset_password_dto.dart';
import 'package:base_https/vn.base.https/data/dto/school_dto.dart';
import 'package:base_https/vn.base.https/data/dto/send_otp_dto.dart';
import 'package:base_https/vn.base.https/domain/model/ParrentProfileEntity.dart';
import 'package:base_https/vn.base.https/domain/model/account_entity.dart';
import 'package:base_https/vn.base.https/domain/model/change_password_after_reset_entity.dart';
import 'package:base_https/vn.base.https/domain/model/create_device_by_user_entity.dart';
import 'package:base_https/vn.base.https/domain/model/register_entity.dart';
import 'package:base_https/vn.base.https/domain/model/reset_password_entity.dart';
import 'package:base_https/vn.base.https/domain/model/school_entity.dart';
import 'package:base_https/vn.base.https/domain/model/send_otp_entity.dart';
import 'package:base_https/vn.base.https/domain/repository/remote_repository.dart';

import '../model/log_out_entity.dart';
import '../repository/local_repository.dart';

@injectable
class UserUseCase extends BaseAPIUseCase {
  final LocalTopicsRepository localRepo;
  final RemoteRepository remoteRepo;

  @InjectableInit()
  UserUseCase(this.localRepo, this.remoteRepo);

  void login(Map<String, dynamic> body, Function(Object) callBack) {
    execAPI(callBack, () {
      remoteRepo.login(
        api.APIImpl((data) {
          handleBack(callBack, data, success: (dataSuccess) {
            logger.i('Login success = ' + dataSuccess.toString());
            final rs = dataSuccess as api.SuccessAPI;
            AccountDto dto = rs.data as AccountDto;
            final data = AccountEntity.toEntity(dto);
            callBack(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void register(Map<String, dynamic> body, Function(Object) callBack) {
    execAPI(callBack, () {
      remoteRepo.register(
        api.APIImpl((data) {
          handleBack(callBack, data, success: (dataSuccess) {
            logger.i('Register success = ' + dataSuccess.toString());
            final rs = dataSuccess as api.SuccessAPI;
            RegisterDto dto = rs.data as RegisterDto;
            final data = RegisterEntity.toEntity(dto);
            callBack(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void sendOtp(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.sendOtp(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i('Send OTP success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            SendOtpDto dto = response.data as SendOtpDto;
            final data = SendOtpEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void resetPassword(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.resetPassword(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i('Reset Password success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            ResetPasswordDto dto = response.data as ResetPasswordDto;
            final data = ResetPasswordEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void getParentProfile(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.getParentProfile(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i('Get parent profile success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            ParentProfileDto dto = response.data as ParentProfileDto;
            final data = ParentProfileEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void updateParentProfile(
      Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.updateParentProfile(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger
                .i('Update parent profile success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            MeDto dto = response.data as MeDto;
            final data = MeEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void changeParentPassword(
      Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.changeParentPassword(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i(
                'Change password parent success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            ChangePasswordDto dto = response.data as ChangePasswordDto;
            final data = ChangePasswordEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void childrenByParent(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.childrenByParent(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger
                .i('Update parent profile success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            List<ChildrenDto> dto = response.data as List<ChildrenDto>;
            var data = dto.map((e) => ChildrenEntity.toEntity(e)).toList();
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void createChild(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.createChild(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i('Create child success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            ChildrenDto dto = response.data as ChildrenDto;
            final data = ChildrenEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void deleteChild(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.deleteChild(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i('Delete child success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            ChildrenDto dto = response.data as ChildrenDto;
            final data = ChildrenEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void updateChild(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.updateChild(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger
                .i('Update child profile success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            ChildrenDto dto = response.data as ChildrenDto;
            final data = ChildrenEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void updateChildByParent(
      Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.updateChildByParent(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i('Update child profile by parent success = ' +
                dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            ChildrenDto dto = response.data as ChildrenDto;
            final data = ChildrenEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void createDeviceByUser(
      Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.createDeviceByUser(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger
                .i('Create Device By User success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            CreateDeviceByUserDto dto = response.data as CreateDeviceByUserDto;
            final data = CreateDeviceByUserEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void changeParentPasswordAfterReset(
      Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.changeParentPasswordAfterReset(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i('Change password after reset success = ' +
                dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            ChangePasswordAfterResetDto dto =
                response.data as ChangePasswordAfterResetDto;
            final data = ChangePasswordAfterResetEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void logOut(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.logOut(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i('Log out success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            LogOutDto dto = response.data as LogOutDto;
            final data = LogOutEntity.toEntity(dto);
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }

  void searchSchools(Map<String, dynamic> body, Function(Object) callback) {
    execAPI(callback, () {
      remoteRepo.searchSchools(
        api.APIImpl((data) {
          handleBack(callback, data, success: (dataSuccess) {
            logger.i('Search Schools success = ' + dataSuccess.toString());
            final response = dataSuccess as api.SuccessAPI;
            List<SchoolDto> dto = response.data as List<SchoolDto>;
            var data = dto.map((e) => SchoolEntity.toEntity(e)).toList();
            callback(Success(data));
          });
        }),
        body: body,
      );
    });
  }
}
