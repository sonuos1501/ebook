import 'package:base_core/vn.base.cores/remote/base_source_module.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:base_https/vn.base.https/data/remote/app_api.dart';
import 'package:base_https/vn.base.https/data/remote/repository/remote_repository_impl.dart';

import '../../domain/repository/remote_repository.dart';

@module
abstract class DataSourceModule extends BaseDataSourceModule {
  @singleton
  AppAPI providesAppAPI(GraphQLClient graphQLClient) => AppAPI(graphQLClient);

  @override
  GraphQLClient providesClient(HttpLink httpLink) {
    return super.providesClient(httpLink);
  }

  @override
  HttpLink providesHttpLink() {
    return super.providesHttpLink();
  }

  @singleton
  RemoteRepository provideRemoteRepository(AppAPI api) {
    return RemoteRepositoryImpl(api);
  }
}
