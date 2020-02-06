import 'package:datacaixa/common/contants.dart';
import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:sqflite/sqlite_api.dart';

class OrderDao implements DaoHelper {
  @override
  Database db;

  @override
  void createTable() async {
    await db.execute(
      '''CREATE TABLE $orderTable 
            ($hotelId INTEGER, 
            $orderId INTEGER, 
            $pdvId INTEGER, 
            $userId INTEGER, 
            $tableId INTEGER, 
            $clientId INTEGER, 
            $employeeId INTEGER, 
            $openingDate TEXT, 
            $closingDate TEXT, 
            $totalValue REAL, 
            $people INTEGER, 
            $status TEXT, 
            $tableStatus TEXT, 
            $comment TEXT, 
            $deliverer INTEGER, 
            $deliveryStatus TEXT, 
            $deliveryDate TEXT, 
            $deliveryTime TEXT, 
            $type TEXT)'''
    );
  }

  @override
  Future get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  void insert(item) {
    // TODO: implement insert
  }

  @override
  void insertAll(List items) {
    // TODO: implement insertAll
  }

  @override
  void update(item) {
    // TODO: implement update
  }

  @override
  void delete(item) {
    // TODO: implement delete
  }

}