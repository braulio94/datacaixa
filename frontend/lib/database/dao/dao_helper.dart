import 'package:sqflite/sqlite_api.dart';

abstract class DaoHelper {
  Database db;

  void createTable();
  void insert(dynamic item);
  void insertAll(List<dynamic> items);
  void update(dynamic item);
  Future<dynamic> get();
  Future<List<dynamic>> getAll();
  void delete(dynamic item);
}