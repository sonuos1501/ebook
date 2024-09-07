import 'package:floor/floor.dart';

import 'entity/db_entity.dart';

@dao
abstract class DBDao {
  @Query('SELECT data FROM DBEntity WHERE path = /news')
  Future<dynamic> getNews();

  @Query('SELECT data FROM DBEntity WHERE path LIKE \'%/notify%\'')
  Future<List<dynamic>> getNotifies();

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> addData(DBEntity item);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> replaceData(DBEntity item);
}
