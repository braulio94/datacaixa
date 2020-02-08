import 'package:sqflite/sqflite.dart';

abstract class DaoHelper {
  void createTable(Database database);
  void insert(dynamic item);
  void insertAll(List<dynamic> items);
  void update(dynamic item);
  Future<dynamic> get(int id, DatabaseTable table);
  Future<List<dynamic>> getAll(DatabaseTable table);
  void delete(dynamic item);
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