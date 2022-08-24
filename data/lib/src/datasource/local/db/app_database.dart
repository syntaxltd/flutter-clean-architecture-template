import 'dart:io';

import 'package:data/src/datasource/local/dao/article_dao.dart';
import 'package:data/src/datasource/local/entity/article_entity.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final Directory dbFolder = await getApplicationDocumentsDirectory();
    if (!await dbFolder.exists()) {
      await dbFolder.create(recursive: true);
    }

    final dbFile = File(p.join(dbFolder.path, 'db.sqlite'));

    return VmDatabase(dbFile);
  });
}

@UseMoor(tables: <Type>[Articles], daos: <Type>[ArticleDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
