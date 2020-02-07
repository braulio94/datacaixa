import 'dart:io';
import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:datacaixa/database/dao/order_dao.dart';
import 'package:datacaixa/database/dao/order_dao.dart';
import 'package:datacaixa/database/dao/product_dao.dart';
import 'package:datacaixa/database/helper.dart';
import 'package:datacaixa/database/store_queries.dart';
import 'package:datacaixa/database/store_queries_helper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataStore implements DataStoreHelper {
  Database db;
  String dbName = 'datacaixa.db';
  StoreQueriesHelper storeHelper = StoreQueries();
  String path;
  DaoHelper orderDao;



  @override
  void create(Database database, int version) async {
    orderDao = OrderDao(database);
    //productDao = ProductDao(db);
  }

  @override
  Future<Database> connect() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, dbName);
    delete();
    try {
      await Directory(databasesPath).create(recursive: true);
      db = await openDatabase(path, version: 1, onCreate: create);
    } catch (_) {
      print("ERROR CONNECTING TO DATABASE");
    }
    return db;
  }

  @override
  void configure() async {

  }

  @override
  void preload() async {

  }

  @override
  void disconnect() async {
    db.close();
  }

  @override
  void delete() async {
    await deleteDatabase(path);
  }
}