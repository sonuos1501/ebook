import 'dart:io';

import 'package:base_core/vn.base.cores/common/storage.dart';
import 'package:base_core/vn.base.cores/remote/api.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:synchronized/synchronized.dart';
import 'package:base_https/vn.base.https/data/dto/account_dto.dart';
import 'package:base_https/vn.base.https/data/dto/app_log_dto.dart';
import 'package:base_https/vn.base.https/data/dto/application_dto.dart';
import 'package:base_https/vn.base.https/data/dto/link_dto.dart';
import 'package:base_https/vn.base.https/data/dto/logout_dto.dart';
import 'package:base_https/vn.base.https/data/dto/parent_profile_dto.dart';
import 'package:base_https/vn.base.https/data/dto/register_dto.dart';
import 'package:base_https/vn.base.https/data/dto/reset_password_dto.dart';
import 'package:base_https/vn.base.https/data/dto/school_dto.dart';
import 'package:base_https/vn.base.https/data/dto/send_otp_dto.dart';
import 'package:base_https/vn.base.https/data/dto/time_dto.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/change_parent_password_ql.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/children_by_parent_ql.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/create_app_for_child_ql.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/create_child_ql.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/create_device_by_user_ql.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/create_link_for_child.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/delete_child_ql.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/delete_link_for_child.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/get_links_for_child.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/get_list_apps_by_child_ql.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/get_prarent_profile.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/login.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/logout_ql.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/refresh_token_ql.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/register.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/search_by_school_ql.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/send_otp.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/update_app_for_child_ql.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/update_child_by_parent_ql.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/update_child_ql.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/update_link_for_child.dart';
import 'package:base_https/vn.base.https/data/remote/grapql/update_parent_profile.dart';
import 'package:base_https/vn.base.https/gen/injection.dart';

import '../dto/change_password_after_reset_dto.dart';
import '../dto/create_device_by_user_dto.dart';
import '../dto/refresh_dto.dart';
import '../dto/version_dto.dart';
import 'grapql/create_time_management.dart';
import 'grapql/get_time_management.dart';
import 'grapql/get_version_update_ql.dart';
import 'grapql/load_app_log_ql.dart';
import 'grapql/reset_password_ql.dart';
import 'grapql/update_app_log_ql.dart';
import 'grapql/update_change_alldays.dart';
import 'grapql/update_change_weekdays.dart';
import 'grapql/update_count_app_log_ql.dart';

class AppAPI extends API {
  AppAPI(GraphQLClient client) : super(client);

  Future<QueryResult<Object?>> _execQL({
    required String graphQL,
    Map<String, dynamic> variables = const {},
    isNeedRefresh = true,
  }) async {
    client = GraphQLClient(
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: AuthLink(
              getToken: () async => 'Bearer ${StorageService.to.getToken()}')
          .concat(getIt<HttpLink>()),
    );
    QueryResult result = await client.mutate(
      MutationOptions(
        document: gql(graphQL), // this
        variables: variables,
      ),
    );
    if (result.hasException) {
      if (result.exception!.graphqlErrors.length > 0) {
        bool rs = (result.exception?.graphqlErrors[0].message ?? '') ==
            'Unauthorized';
        if (rs) {
          var lock = new Lock();
          await lock.synchronized(() => _refreshToken());
          if (rs) {
            sleep(Duration(seconds: 1));
            client = GraphQLClient(
              cache: GraphQLCache(
                store: HiveStore(),
              ),
              link: AuthLink(
                      getToken: () async =>
                          'Bearer ${StorageService.to.getToken()}')
                  .concat(getIt<HttpLink>()),
            );
            print('NEON ------HERRRE');
            result = await client.mutate(
              MutationOptions(
                document: gql(graphQL), // this
                variables: variables,
              ),
            );
            if (result.hasException) {
              throw result.exception!;
            }
          } else {
            throw result.exception!;
          }
        } else {
          throw result.exception!;
        }
      } else {
        throw result.exception!;
      }
    }
    if (result.data == null) {
      result.data = {};
    }
    return result;
  }

  /// region User
  /// region - Authentication

  /// Login User
  Future<AccountDto> login(Map<String, dynamic> body) async {
    var rs = await _execQL(
        graphQL: loginQL(), variables: body, isNeedRefresh: false);
    return AccountDto.fromJson(rs.data!);
  }

  /// Logout
  // logoutQL

  /// Refresh Token
  Future<bool> _refreshToken() async {
    final client2 = GraphQLClient(
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: AuthLink(
              getToken: () async =>
                  'Bearer ${StorageService.to.getRefreshToken()}')
          .concat(getIt<HttpLink>()),
    );
    QueryResult result = await client2.mutate(
      MutationOptions(
        document: gql(refreshTokenQL()), // this
        variables: const {},
      ),
    );
    if (result.hasException || result.data == null) {
      return false;
    }
    final acc = RefreshDto.fromJson(result.data!);
    await StorageService.to.setToken(userToken: acc.accessToken!);
    await StorageService.to.setRefreshToken(refreshToken: acc.refreshToken!);
    print('NEON-----------DONE REFRESH');
    return true;
  }

  /// endregion

  /// region - Registration

  /// Register User and Send Confirmation Email
  Future<RegisterDto> register(Map<String, dynamic> body) async {
    var rs = await _execQL(
        graphQL: registerQL(), variables: body, isNeedRefresh: false);
    return RegisterDto.fromJson(rs.data!);
  }

  /// endregion

  /// region - Reset Password

  /// Reset Password
  Future<ResetPasswordDto> resetPassword(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: resetPasswordQL(), variables: body);
    return ResetPasswordDto.fromJson(rs.data!);
  }

  /// Change Password
  // changePasswordAfterResetQL

  /// endregion

  /// region - General

  /// verify OTP
  /// VerifyType: Register | ResetPassword
  Future<SendOtpDto> sendOtp(Map<String, dynamic> body) async {
    var rs = await _execQL(
        graphQL: sendOtpQL(), variables: body, isNeedRefresh: false);
    return SendOtpDto.fromJson(rs.data!);
  }

  /// Update Child's Profile
  Future<ChildrenDto> updateChildByParent(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: updateChildByParentQL(), variables: body);
    return ChildrenDto.fromJson(rs.data!['updateOneChildByParent']);
  }

  /// Search By School
  Future<List<SchoolDto>> searchSchools(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: searchBySchoolQL(), variables: body);
    var lst = rs.data!['schools'] as List<dynamic>;
    var result = lst.map((e) => SchoolDto.fromJson(e)).toList();
    return result;
  }

  /// endregion

  /// region - Information

  /// Get Self Profile
  Future<ParentProfileDto> getParentProfile(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: getParentProfileQL(body));
    return ParentProfileDto.fromJson(rs.data!);
  }

  /// Update Profile
  Future<MeDto> updateParentProfile(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: updateParentProfileQL(body));
    return MeDto.fromJson(rs.data!['updateProfile']);
  }

  /// Change Password
  Future<ChangePasswordDto> changeParentPassword(
      Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: changeParentPasswordQL(), variables: body);
    return ChangePasswordDto.fromJson(rs.data!['updateOneUser']);
  }

  Future<ChangePasswordAfterResetDto> changeParentPasswordAfterReset(
      Map<String, dynamic> body) async {
    var rs =
        await _execQL(graphQL: changePasswordAfterResetQL(), variables: body);
    return ChangePasswordAfterResetDto.fromJson(rs.data!['updateProfile']);
  }

  /// endregion

  /// region - Device

  /// endregion

  /// endregion

  /// region Child

  /// region - AppManage

  /// CreateAppByChild
  Future<ApplicationDto> createAppForChild(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: createAppForChildQL(), variables: body);
    return ApplicationDto.fromJson(rs.data!['createAppByChild']);
  }

  /// AppsByChild
  Future<List<ApplicationDto>> appByChild(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: getListAppByChildQL(), variables: body);
    var lst = rs.data!['appsByChild'] as List<dynamic>;
    return lst.map((e) => ApplicationDto.fromJson(e)).toList();
  }

  /// UpdateAppByChild
  Future<int> updateAppForChild(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: updateAppForChildQL(), variables: body);
    var data = rs.data!['updateAppByChild'];
    var count = data['count'] as int?;
    return count ?? 0;
  }

  /// updateChangeAllWeek
  Future<TimeDto> updateChangeAllWeek(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: updateChangeAllDaysQL(), variables: body);
    return TimeDto.fromJson('updateTimeAccessByChild', rs.data!);
  }

  /// updateChangeWeekdays
  Future<TimeDto> updateChangeWeekdays(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: updateChangeWeekdaysQL(), variables: body);
    return TimeDto.fromJson('updateTimeAccessByChild', rs.data!);
  }

  /// Update all app setting for child
  Future<int> updateAllAppForChild(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: updateAllAppForChildQL(), variables: body);
    var data = rs.data!['updateAppByChild'];
    var count = data['count'] as int?;
    ;
    return count ?? 0;
  }

  /// Create list app for child
  Future<int> createListAppAppForChild(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: createManyAppForChildQL(), variables: body);
    var data = rs.data!['createManyApp'];
    var count = data['count'] as int?;
    return count ?? 0;
  }

  /// region - getVersionUpdate
  Future<VersionDto> getVersionUpdate(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: getVersionUpdateQL(), variables: body);
    var lst = rs.data!['versions'] as List<dynamic>;
    var result = lst.map((e) => VersionDto.fromJson(e)).toList();
    return result[0];
  }

  /// CreateAppLogByChild

  /// AppLogsByChild

  /// endregion

  /// region - WebsiteManagement

  /// endregion

  /// region - TimeManagement

  /// endregion

  /// region - LinkManagement

  /// Create link
  Future<LinkDto> createLinkForChild(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: createLinkForChildQL(), variables: body);
    return LinkDto.fromJson(rs.data!['createLinkByChild']);
  }

  /// Update link
  Future<int> updateLinkForChild(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: updateLinkForChildQL(), variables: body);
    var data = rs.data!['updateLinkByChild'];
    var count = data['count'] as int?;
    return count ?? 0;
  }

  /// Update log
  Future<bool> updateAppLog(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: updateAppLogQL(), variables: body);
    var isOK = rs.data!['createManyAppLogByChild'] as bool?;
    return isOK ?? false;
  }

  /// load app log
  Future<List<AppLogDto>> loadAppLog(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: loadAppLogQL(), variables: body);
    var lst = rs.data!['appLogsByChild'] as List<dynamic>;
    var result = lst.map((e) => AppLogDto.fromJson(e)).toList();
    return result;
  }

  /// Update count log
  Future<bool> updateCountAppLog(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: updateCountAppLogQL(), variables: body);
    var isOK = rs.data!['countManyAppLogByChild'] as bool?;
    return isOK ?? false;
  }

  /// Get links
  Future<List<LinkDto>> getLinksForChild(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: getLinksForChildQL(), variables: body);
    var lst = rs.data!['linksByChild'] as List<dynamic>;
    var result = lst.map((e) => LinkDto.fromJson(e)).toList();
    return result;
  }

  /// Delete link
  Future<int> deleteLinkForChild(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: deleteLinkForChildQL(), variables: body);
    var data = rs.data!['deleteLinkByChild'];
    var count = data['count'] as int?;
    return count ?? 0;
  }

  /// endregion

  /// region - Weekdays
  /// endregion

  /// region - General

  ///Create One Child
  Future<ChildrenDto> createChild(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: createChildQL(), variables: body);
    return ChildrenDto.fromJson(rs.data!['createOneChildByParent']);
  }

  /// Get children by user
  Future<List<ChildrenDto>> childrenByParent(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: childrenByParentQL());
    var lst = rs.data!['childrenByParent'] as List<dynamic>;
    return lst.map((e) => ChildrenDto.fromJson(e)).toList();
  }

  /// Delete One Child
  Future<ChildrenDto> deleteChild(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: deleteChildQL(), variables: body);
    return ChildrenDto.fromJson(rs.data!['deleteOneChild']);
  }

  /// Update Child's Profile
  Future<ChildrenDto> updateChild(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: updateChildQL(), variables: body);
    return ChildrenDto.fromJson(rs.data!['updateOneChildByParent']);
  }

  /// Login Children
  //loginChildrenQL

  /// endregion

  Future<CreateDeviceByUserDto> createDeviceByUser(
      Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: createDeviceByUserQL(), variables: body);
    return CreateDeviceByUserDto.fromJson(rs.data!);
  }

  Future<TimeDto> getTimeManagement(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: getTimeManagementQL(), variables: body);
    return TimeDto.fromJson('timeAccess', rs.data!);
  }

  Future<TimeDto> createTimeManagement(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: createTimeManagementQL(), variables: body);
    return TimeDto.fromJson('createTimeAccessByChild', rs.data!);
  }

  Future<LogOutDto> logOut(Map<String, dynamic> body) async {
    var rs = await _execQL(graphQL: logoutQL(), variables: body);
    return LogOutDto.fromJson(rs.data!);
  }
}
