import 'package:sqflite/sqflite.dart';

abstract class DaoHelper {
  void createTable(Database database);
  void insert(dynamic item);
  void insertAll(List<dynamic> items);
  void update(dynamic item);
  Future<dynamic> get(int id);
  Future<List<dynamic>> getAll();
  void delete(dynamic item);
}