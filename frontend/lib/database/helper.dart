import 'package:sqflite/sqflite.dart';

abstract class DataStoreHelper {
  void create(Database db, int version);
  void connect(String path);
  void disconnect();
  void configure();
  void preload();
}