import 'package:sqflite/sqflite.dart';

abstract class DaoHelper {
  createTable(Database database);
  insert(dynamic item);
  insertAll(List<dynamic> items);
  update(dynamic item);
  Future<dynamic> get(int id);
  getAll();
  remove(dynamic item);
  removeAll(List<dynamic> items);
  removeNoneExisting(List<dynamic> newItems);
}