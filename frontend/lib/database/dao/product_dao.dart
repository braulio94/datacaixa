import 'package:datacaixa/common/contants.dart';
import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:datacaixa/models/product.dart';
import 'package:sqflite/sqlite_api.dart';

class ProductDao implements DaoHelper{

  @override
  Database db;
  ProductDao(this.db);

  @override
  void createTable() async {
    await db.execute(
        "CREATE TABLE $productsTable "
            "($productId INTEGER, "
            "$price REAL, "
            "$description TEXT)"
    );
  }

  @override
  Future get() {
    return null;
  }

  @override
  Future<List> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  void insert(item) {
    Product product = item;

  }

  @override
  void insertAll(List items) {
    // TODO: implement insertAll
  }

  @override
  void update(item) {
    if(item is Product){

    }
  }

  @override
  void delete(item) {
    // TODO: implement delete
  }
}