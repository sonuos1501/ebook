import 'package:database/vn.base.database/db/db.dart';
import 'package:database/vn.base.database/db/db.g.dart';
import 'package:database/vn.base.database/db/db_dao.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:base_core/vn.base.cores/common/constant.dart';
import 'package:base_https/vn.base.https/data/local/repository/local_repository_impl.dart';
import 'package:base_https/vn.base.https/domain/repository/local_repository.dart';

@module
abstract class DatabaseModule {
  @preResolve
  Future<TutorDB> providesCurrenciesDB() {
    return $FloorTutorDB
        .databaseBuilder(dotenv.env[dbName] ?? dbNameError)
        .build();
  }

  @singleton
  DBDao provideDataDao(TutorDB db) => db.dbDao;

  @singleton
  LocalTopicsRepository provideLocalCurrenciesRepository(DBDao currenciesDao) {
    return LocalRepositoryImpl(currenciesDao);
  }
}
