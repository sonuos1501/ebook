import 'package:database/vn.base.database/db/db.dart';
import 'package:database/vn.base.database/db/db_dao.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:base_https/vn.base.https/domain/usecase/link_usercase.dart';

import '../data/local/repository/local_repository_impl.dart';
import '../data/remote/app_api.dart';
import '../data/remote/repository/remote_repository_impl.dart';
import '../di/module/data_source_module.dart';
import '../di/module/database_module.dart';
import '../domain/repository/local_repository.dart';
import '../domain/repository/remote_repository.dart';
import '../domain/usecase/db_usecase.dart';
import '../domain/usecase/user_usecase.dart';
import '../domain/usecase/student_usecase.dart';
import '../domain/usecase/time_usecase.dart';
import '../domain/usecase/log_usecase.dart';
import '../domain/usecase/application_usecase.dart';
import '../domain/usecase/device_usecase.dart';

Future<GetIt> $initGetIt(
  GetIt get, {
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
  final gh = GetItHelper(
    get,
    environment,
    environmentFilter,
  );

  final dataSourceModule = _$DataSourceModule();
  final databaseModule = _$DatabaseModule();
  gh.factory<HttpLink>(() => dataSourceModule.providesHttpLink());
  gh.factory<GraphQLClient>(
      () => dataSourceModule.providesClient(get<HttpLink>()));
  await gh.factoryAsync<TutorDB>(() => databaseModule.providesCurrenciesDB(),
      preResolve: true);
  gh.singleton<AppAPI>(dataSourceModule.providesAppAPI(get<GraphQLClient>()));
  gh.singleton<DBDao>(databaseModule.provideDataDao(get<TutorDB>()));
  gh.factory<LocalRepositoryImpl>(() => LocalRepositoryImpl(get<DBDao>()));
  gh.singleton<LocalTopicsRepository>(
      databaseModule.provideLocalCurrenciesRepository(get<DBDao>()));
  gh.singleton<RemoteRepository>(
      dataSourceModule.provideRemoteRepository(get<AppAPI>()));
  gh.factory<RemoteRepositoryImpl>(() => RemoteRepositoryImpl(get<AppAPI>()));
  gh.factory<DBUseCase>(() => DBUseCase(get<LocalTopicsRepository>()));
  gh.factory<UserUseCase>(
      () => UserUseCase(get<LocalTopicsRepository>(), get<RemoteRepository>()));
  gh.factory<ApplicationUseCase>(() => ApplicationUseCase(
      get<LocalTopicsRepository>(), get<RemoteRepository>()));
  gh.factory<LinkUseCase>(
      () => LinkUseCase(get<LocalTopicsRepository>(), get<RemoteRepository>()));
  gh.factory<StudentUseCase>(() => StudentUseCase(get<RemoteRepository>()));
  gh.factory<TimeUseCase>(() => TimeUseCase(get<RemoteRepository>()));
  gh.factory<DeviceUseCase>(() => DeviceUseCase(get<RemoteRepository>()));
  gh.factory<LogUseCase>(() => LogUseCase(get<RemoteRepository>()));

  return get;
}

class _$DataSourceModule extends DataSourceModule {}

class _$DatabaseModule extends DatabaseModule {}
