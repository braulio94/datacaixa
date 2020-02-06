import 'package:sqflite/sqflite.dart';

abstract class DataStoreHelper {
  void create(Database db, int version);
  Future<Database> connect();
  void disconnect();
  void configure();
  void delete();
  void preload();
}