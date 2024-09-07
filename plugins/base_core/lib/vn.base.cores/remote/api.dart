import 'package:graphql_flutter/graphql_flutter.dart';

abstract class API {
  late GraphQLClient client;

  API(this.client);
}
