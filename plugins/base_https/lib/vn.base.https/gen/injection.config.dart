// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:database/vn.base.database/db/db.dart' as _i4;
import 'package:database/vn.base.database/db/db_dao.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../data/local/repository/local_repository_impl.dart' as _i14;
import '../data/remote/app_api.dart' as _i5;
import '../data/remote/repository/remote_repository_impl.dart' as _i7;
import '../di/module/data_source_module.dart' as _i19;
import '../di/module/database_module.dart' as _i20;
import '../domain/repository/local_repository.dart' as _i13;
import '../domain/repository/remote_repository.dart' as _i8;
import '../domain/usecase/application_usecase.dart' as _i15;
import '../domain/usecase/db_usecase.dart' as _i18;
import '../domain/usecase/device_usecase.dart' as _i12;
import '../domain/usecase/link_usercase.dart' as _i17;
import '../domain/usecase/log_usecase.dart' as _i10;
import '../domain/usecase/student_usecase.dart' as _i11;
import '../domain/usecase/time_usecase.dart' as _i9;
import '../domain/usecase/user_usecase.dart' as _i16;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dataSourceModule = _$DataSourceModule();
  final databaseModule = _$DatabaseModule();
  gh.factory<_i3.HttpLink>(() => dataSourceModule.providesHttpLink());
  await gh.factoryAsync<_i4.TutorDB>(
    () => databaseModule.providesCurrenciesDB(),
    preResolve: true,
  );
  gh.factory<_i3.GraphQLClient>(
      () => dataSourceModule.providesClient(gh<_i3.HttpLink>()));
  gh.singleton<_i5.AppAPI>(
      () => dataSourceModule.providesAppAPI(gh<_i3.GraphQLClient>()));
  gh.singleton<_i6.DBDao>(
      () => databaseModule.provideDataDao(gh<_i4.TutorDB>()));
  gh.factory<_i7.RemoteRepositoryImpl>(
      () => _i7.RemoteRepositoryImpl(gh<_i5.AppAPI>()));
  gh.singleton<_i8.RemoteRepository>(
      () => dataSourceModule.provideRemoteRepository(gh<_i5.AppAPI>()));
  gh.factory<_i9.TimeUseCase>(
      () => _i9.TimeUseCase(gh<_i8.RemoteRepository>()));
  gh.factory<_i10.LogUseCase>(
      () => _i10.LogUseCase(gh<_i8.RemoteRepository>()));
  gh.factory<_i11.StudentUseCase>(
      () => _i11.StudentUseCase(gh<_i8.RemoteRepository>()));
  gh.factory<_i12.DeviceUseCase>(
      () => _i12.DeviceUseCase(gh<_i8.RemoteRepository>()));
  gh.singleton<_i13.LocalTopicsRepository>(
      () => databaseModule.provideLocalCurrenciesRepository(gh<_i6.DBDao>()));
  gh.factory<_i14.LocalRepositoryImpl>(
      () => _i14.LocalRepositoryImpl(gh<_i6.DBDao>()));
  gh.factory<_i15.ApplicationUseCase>(() => _i15.ApplicationUseCase(
        gh<_i13.LocalTopicsRepository>(),
        gh<_i8.RemoteRepository>(),
      ));
  gh.factory<_i16.UserUseCase>(() => _i16.UserUseCase(
        gh<_i13.LocalTopicsRepository>(),
        gh<_i8.RemoteRepository>(),
      ));
  gh.factory<_i17.LinkUseCase>(() => _i17.LinkUseCase(
        gh<_i13.LocalTopicsRepository>(),
        gh<_i8.RemoteRepository>(),
      ));
  gh.factory<_i18.DBUseCase>(
      () => _i18.DBUseCase(gh<_i13.LocalTopicsRepository>()));
  return getIt;
}

class _$DataSourceModule extends _i19.DataSourceModule {}

class _$DatabaseModule extends _i20.DatabaseModule {}
