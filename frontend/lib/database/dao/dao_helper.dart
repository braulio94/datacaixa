import 'package:sqflite/sqflite.dart';

abstract class DaoHelper {
  void createTable(Database database);
  void insert(dynamic item);
  void insertAll(List<dynamic> items);
  void update(dynamic item);
  Future<dynamic> get(int id, String table);
  Future<List<dynamic>> getAll();
  void delete(int id);
}

enum DatabaseTable {
  Client,
  Order,
  OrderItem,
  Product,
  ProductGroup,
  Table,
  User
}