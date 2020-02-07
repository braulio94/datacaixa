import 'package:datacaixa/common/contants.dart';
import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:datacaixa/models/order.dart';
import 'package:sqflite/sqlite_api.dart';

class OrderDao implements DaoHelper {
  Database db;
  OrderDao(Database database){
    this.db = database;
    print("DATABASE $db");
    createTable();
  }

  @override
  void createTable() async {
    await db.execute(
      "CREATE TABLE $orderTable "
            "($hotelId INTEGER, "
            "$orderId INTEGER, "
            "$pdvId INTEGER, "
            "$userId INTEGER, "
            "$tableId INTEGER, "
            "$clientId INTEGER, "
            "$employeeId INTEGER, "
            "$openingDate TEXT, "
            "$closingDate TEXT, "
            "$totalValue REAL, "
            "$people INTEGER, "
            "$status TEXT, "
            "$tableStatus TEXT, "
            "$comment TEXT, "
            "$deliverer INTEGER, "
            "$deliveryStatus TEXT, "
            "$deliveryDate TEXT, "
            "$deliveryTime TEXT, "
            "$type TEXT) "
    );
  }

  @override
  Future get(int id) async {
    List<Map> maps = await db.query(orderTable,
        columns: [
          hotelId,
          orderId,
          pdvId,
          userId,
          tableId,
          clientId,
          employeeId,
          openingDate,
          closingDate,
          totalValue,
          people,
          status,
          tableStatus,
          comment,
          deliverer,
          deliveryStatus,
          deliveryDate,
          deliveryTime,
          type
        ],
        where: '$orderId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Order.fromMap(maps.first);
    }
  }

  @override
  Future<List> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  void insert(item) async {
    if(item is Order){
      await db.insert(orderTable, item.toMap());
    }
  }

  @override
  void insertAll(List items) {
    if(items is List<Order>){
      for(Order item in items){
        insert(item);
      }
    }
  }

  @override
  void update(item) async {
    if(item is Order){
      await db.update(orderTable, item.toMap(),
          where: '$orderId = ?', whereArgs: [item.orderId]);
    }
  }

  @override
  void delete(int id) async {
    await db.delete(orderTable,
        where: '$orderId = ?', whereArgs: [id]);
  }
}