import 'package:sqflite/sqflite.dart';

abstract class StoreQueriesHelper {
  void createProductTable(Database db);
}