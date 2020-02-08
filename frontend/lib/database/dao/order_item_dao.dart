import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:datacaixa/models/order_item.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:datacaixa/common/contants.dart';

class OrderItemDao implements DaoHelper {
  Database db;
  OrderItemDao(this.db);


  OrderItemDao.createTable(Database database){
    createTable(database);
  }

  @override
  void createTable(Database database) async {
    await database.execute(
        "CREATE TABLE $orderItemsTable "
            "($identifier INTEGER PRIMARY KEY AUTOINCREMENT, "
            "$hotelId INTEGER, "
            "$orderItemId INTEGER, "
            "$orderId INTEGER, "
            "$productId INTEGER, "
            "$sequence INTEGER, "
            "$quantity INTEGER, "
            "$unitValue REAL, "
            "$totalValue REAL)"
    );
    print("CREATED ORDER ITEM TABLE");
  }

  @override
  Future get(int id, DatabaseTable table) async {
    if(table == DatabaseTable.OrderItem){
      List<Map> maps = await db.query(orderItemsTable,
          columns: [
            identifier,
            orderItemId,
            orderId,
            productId,
            sequence,
            quantity,
            unitValue,
            totalValue,
          ],
          where: '$identifier = ?',
          whereArgs: [id]
      );
      if(maps.length > 0)
        return OrderItem.fromMap(maps.first);
    }
    return OrderItem();
  }

  @override
  Future<List> getAll(DatabaseTable table) async {
    if(table == DatabaseTable.OrderItem){
      List<Map> maps = await db.query(orderItemsTable,
        columns: [
          identifier,
          orderItemId,
          orderId,
          productId,
          sequence,
          quantity,
          unitValue,
          totalValue,
        ],
      );
      if(maps.length > 0) {
        return maps.map((map) => OrderItem.fromMap(map)).toList();
      }
    }
    return [];
  }

  @override
  void insert(item) async {
    if(item is OrderItem){
      item.identifier = await db.insert(orderItemsTable, item.toMap());
    }
  }

  @override
  void insertAll(List items) {
    if(items is List<OrderItem>){
      for(OrderItem item in items){
        insert(item);
      }
    }
  }

  @override
  void update(item) async {
    if(item is OrderItem){
      await db.update(orderItemsTable, item.toMap(),
          where: '$identifier = ?', whereArgs: [item.identifier]);
    }
  }

  @override
  void delete(item) async {
    if(item is OrderItem){
      await db.delete(orderItemsTable,
          where: '$identifier = ?', whereArgs: [item.identifier]);
    }
  }
}