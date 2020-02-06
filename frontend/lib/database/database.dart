import 'dart:io';
import 'package:datacaixa/database/helper.dart';
import 'package:datacaixa/database/store_queries.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataStore implements DataStoreHelper {
  Database db;
  String dbName = 'datacaixa.db';
  StoreQueries storeHelper = StoreQueries();

  @override
  void create(Database database, int version) async {
    storeHelper.createProductTable(database);
    storeHelper.createTablesTable(database);
  }

  @override
  void connect(String path) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);

    try {
      await Directory(databasesPath).create(recursive: true);
    } catch (_) {}
    db = await openDatabase(path, onCreate: create);
  }

  @override
  void configure() {

  }

  @override
  void preload() async {

  }

  @override
  void disconnect() async {
    db.close();
  }
}