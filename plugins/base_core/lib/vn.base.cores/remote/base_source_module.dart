import 'package:base_core/vn.base.cores/common/storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

import '../common/constant.dart';

@module
abstract class BaseDataSourceModule {
  HttpLink providesHttpLink() {
    return HttpLink(dotenv.env[baseUrl]!);
  }

  @singleton
  GraphQLClient providesClient(HttpLink httpLink) {
    AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer ${StorageService.to.getToken()}',
    );

    final Link link = authLink.concat(httpLink);
    return GraphQLClient(
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: link,
    );
  }
}
