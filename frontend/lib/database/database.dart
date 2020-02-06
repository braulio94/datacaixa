import 'dart:io';
import 'package:datacaixa/common/contants.dart';
import 'package:datacaixa/database/helper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataStore implements DataStoreHelper {
  Database db;
  String dbName = 'datacaixa.db';

  @override
  void create() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);

    try {
      await Directory(databasesPath).create(recursive: true);
      connect();
    } catch (_) {

    }
  }

  @override
  void connect() async {
    db = await openDatabase(dbName);
  }

  @override
  void configure() {

  }

  @override
  void preload() async {

  }

  @override
  void disconnect() async {
    db = await openDatabase(dbName);
  }
}