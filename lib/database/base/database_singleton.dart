import 'package:sqflite/sqflite.dart';

class DatabaseSingleton {
  static final DatabaseSingleton _databaseSingleton = DatabaseSingleton._();

  DatabaseSingleton._();

  late Database db;

  factory DatabaseSingleton() {
    return _databaseSingleton;
  }
}
