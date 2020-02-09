import 'package:datacaixa/common/contants.dart';
import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:datacaixa/models/table.dart';
import 'package:sqflite/sqlite_api.dart';

class TableDao implements DaoHelper {
  Database db;
  TableDao(this.db);

  @override
  void createTable(Database database) async {
    await database.execute(
        "CREATE TABLE $tablesTable "
            "($identifier INTEGER PRIMARY KEY AUTOINCREMENT, "
            "$hotelId INTEGER, "
            "$pdvId INTEGER, "
            "$tableId INTEGER, "
            "$number INTEGER, "
            "$status TEXT, "
            "$birthDayPerson TEXT, "
            "$vip TEXT, "
            "$honeyMoon TEXT, "
            "$pdv TEXT, "
            "$seats TEXT)"
    );
    print("CREATED TABLE TABLE");
  }

  @override
  Future get(int id, DatabaseTable table) async {
    if(table == DatabaseTable.OrderItem){
      List<Map> maps = await db.query(tablesTable,
          columns: [
            identifier,
            hotelId,
            pdvId,
            tableId,
            number,
            status,
            birthDayPerson,
            vip,
            honeyMoon,
            pdv,
            seats,
          ],
          where: '$identifier = ?',
          whereArgs: [id]
      );
      if(maps.length > 0)
        return Table.fromMap(maps.first);
    }
    return Table();
  }

  @override
  Future<List> getAll(DatabaseTable table) async {
    if(table == DatabaseTable.OrderItem){
      List<Map> maps = await db.query(tablesTable,
        columns: [
          identifier,
          hotelId,
          pdvId,
          tableId,
          number,
          status,
          birthDayPerson,
          vip,
          honeyMoon,
          pdv,
          seats,
        ],
      );
      if(maps.length > 0) {
        return maps.map((map) => Table.fromMap(map)).toList();
      }
    }
    return [];
  }

  @override
  void insert(item) async {
    if(item is Table){
      item.identifier = await db.insert(tablesTable, item.toMap());
    }
  }

  @override
  void insertAll(List items) {
    if(items is List<Table>){
      for(Table item in items){
        insert(item);
      }
    }
  }

  @override
  void update(item) async {
    if(item is Table){
      await db.update(tablesTable, item.toMap(),
          where: '$identifier = ?', whereArgs: [item.identifier]);
    }
  }

  @override
  void delete(item) async {
    if(item is Table){
      await db.delete(orderItemsTable,
          where: '$identifier = ?', whereArgs: [item.identifier]);
    }
  }
}