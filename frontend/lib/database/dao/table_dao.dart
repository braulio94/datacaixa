import 'package:datacaixa/common/database_strings.dart';
import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:datacaixa/models/table.dart';
import 'package:sqflite/sqlite_api.dart';

class TableDao implements DaoHelper {
  Database db;
  TableDao(this.db);

  TableDao.createTable(Database database){
    createTable(database);
  }

  @override
  void createTable(Database database) async {
    await database.execute(
        "CREATE TABLE $tablesTable "
            "($identifier INTEGER PRIMARY KEY AUTOINCREMENT, "
            "$hotelId INTEGER, "
            "$pdvId INTEGER, "
            "$tableId INTEGER UNIQUE, "
            "$number INTEGER, "
            "$status TEXT, "
            "$orderId INTEGER, "
            "$totalValue REAL)"
    );
    print("CREATED TABLE TABLE");
  }

  @override
  Future get(int id) async {
      List<Map> maps = await db.query(tablesTable,
          columns: [
            identifier,
            hotelId,
            pdvId,
            tableId,
            number,
            status,
            orderId,
            totalValue
          ],
          where: '$tableId = ?',
          whereArgs: [id]
      );
      if(maps.length > 0)
        return Table.fromMap(maps.first);

  }

  @override
  Future<List> getAll() async {
      List<Map> maps = await db.query(tablesTable,
        columns: [
          identifier,
          hotelId,
          pdvId,
          tableId,
          number,
          status,
          orderId,
          totalValue
        ],
      );
      if(maps.length > 0) {
        return maps.map((map) => Table.fromMap(map)).toList();
      }
    return [];
  }

  @override
  insert(item) async {
    if(item is Table){
      try {
        item.identifier = await db.insert(tablesTable, item.toMap());
      } catch(_){
        await update(item);
      }
    }
  }

  @override
  void insertAll(List items) async {
    if(items is List<Table>){
      for(Table item in items){
        await insert(item);
      }
    }
  }

  @override
  update(item) async {
    if(item is Table){
      await db.update(tablesTable, item.toMap(),
          where: '$tableId = ?', whereArgs: [item.tableId]);
    }
  }

  @override
  void remove(item) async {
    if(item is Table){
      await db.delete(orderItemsTable,
          where: '$tableId = ?', whereArgs: [item.tableId]);
    }
  }

  @override
  void removeAll(List items) {
    // TODO: implement removeAll
  }

  @override
  removeNoneExisting(List newItems) {
    throw UnimplementedError();
  }
}