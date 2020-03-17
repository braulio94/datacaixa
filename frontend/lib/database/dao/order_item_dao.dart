import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:datacaixa/models/order_item.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:datacaixa/common/database_strings.dart';

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
            "$orderItemId INTEGER UNIQUE, "
            "$orderId INTEGER, "
            "$productId INTEGER, "
            "$userId INTEGER, "
            "$sequence INTEGER, "
            "$quantity INTEGER, "
            "$unitValue REAL, "
            "$totalValue REAL)"
    );
    print("CREATED ORDER ITEM TABLE");
  }

  @override
  Future get(int id) async {
    try {
      List<Map> maps = await db.query(orderItemsTable,
          columns: [
            identifier,
            orderItemId,
            orderId,
            productId,
            userId,
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
    } catch (_){}
    return null;
  }

  @override
  Future<List> getAll() async {
    try {
      List<Map> maps = await db.query(orderItemsTable,
        columns: [
          identifier,
          orderItemId,
          orderId,
          productId,
          userId,
          sequence,
          quantity,
          unitValue,
          totalValue,
        ],
      );
      if(maps.length > 0) {
        return maps.map((map) => OrderItem.fromMap(map)).toList();
      }
    } catch(_){}
    return [];
  }

  Future<List> getAllFromOrder(int order) async {
    try {
      List<Map> maps = await db.query(orderItemsTable,
          columns: [
            identifier,
            orderItemId,
            orderId,
            productId,
            userId,
            sequence,
            quantity,
            unitValue,
            totalValue,
          ],
          where: '$orderId = ?',
          whereArgs: [order]
      );
      if(maps.isNotEmpty) {
        return maps.map((map) => OrderItem.fromMap(map)).toList();
      }
      return <OrderItem>[];
    } catch(_){
      return <OrderItem>[];
    }
  }

  @override
  insert(item) async {
    if(item is OrderItem){
      try {
        await db.insert(orderItemsTable, item.toMap());
      } catch(_){
        await update(item);
      }
    }
  }

  @override
  insertAll(List items) async {
    if(items is List<OrderItem>){
      for(OrderItem item in items){
        await insert(item);
      }
    }
  }

  @override
  update(item) async {
    if(item is OrderItem){
      try{
        await db.update(orderItemsTable, item.toMap(), where: '$orderItemId = ?', whereArgs: [item.orderItemId]);
      } catch(_){}
    }
  }

  @override
  void remove(item) async {
    if(item is OrderItem){
      await db.delete(orderItemsTable,
          where: '$identifier = ?', whereArgs: [item.identifier]);
    }
  }

  @override
  void removeAll(List items) {
    // TODO: implement removeAll
  }

  @override
  removeNoneExisting(List items) async {
    if(items is List<OrderItem>){
      List<int> ids = items.map((i) => i.orderItemId).toList();
      try {
        await db.delete(
          orderItemsTable,
          where: '$orderId NOT IN (${ids.join(', ')})',
        );
      } catch(_){}
    }
  }
}