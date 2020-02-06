import 'package:datacaixa/common/contants.dart';
import 'package:datacaixa/database/store_queries_helper.dart';
import 'package:sqflite/sqlite_api.dart';

class StoreQueries implements StoreQueriesHelper {

  @override
  void createProductTable(db) async {
    await db.execute(
        "CREATE TABLE $productsTable "
            "($productId INTEGER, "
            "$price REAL, "
            "$description TEXT)"
    );
  }

  @override
  void createTablesTable(Database db) async {
    await db.execute(
        "CREATE TABLE $tablesTable "
            "($hotelId INTEGER, "
            "$pdvId INTEGER, "
            "$tableId INTEGER, "
            "$number TEXT, "
            "$status TEXT, "
            "$birthDayPerson TEXT, "
            "$vip TEXT, "
            "$honeyMoon TEXT, "
            "$pdv TEXT, "
            "$seats INTEGER)"
    );
  }
}