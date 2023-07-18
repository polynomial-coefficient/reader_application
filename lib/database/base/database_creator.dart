import 'dart:async';
import 'package:path/path.dart';
import 'package:reader_application/database/base/database_singleton.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseCreator {
  Future<Database> initializationDataBase(
      String dataBaseName, String sqlSentence) async {
    String path = await getDatabasesPath();
    //打开数据库
    DatabaseSingleton().db = await openDatabase(
      join(path, dataBaseName),
      onCreate: (database, version) async {
        await database.execute(
          sqlSentence,
        );
      },
      version: 1,
    );

    return DatabaseSingleton().db;
  }
}
