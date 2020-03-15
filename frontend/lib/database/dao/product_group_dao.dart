import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:datacaixa/models/product_group.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:datacaixa/common/database_strings.dart';

class ProductGroupDao implements DaoHelper {
  Database db;
  ProductGroupDao(this.db);

  ProductGroupDao.createTable(Database database){
    createTable(database);
  }

  @override
  void createTable(Database database) async {
    await database.execute(
        "CREATE TABLE $productGroupTable "
            "($identifier INTEGER PRIMARY KEY AUTOINCREMENT, "
            "$hotelId INTEGER, "
            "$productGroupId INTEGER UNIQUE, "
            "$description TEXT, "
            "$display TEXT, "
            "$code INTEGER)"
    );
  }

  @override
  Future get(int id) async {
      List<Map> maps = await db.query(productGroupTable,
          columns: [identifier, hotelId, productGroupId, description, display, code],
          where: '$identifier = ?',
          whereArgs: [id]
      );
      if(maps.length > 0)
        return ProductGroup.fromMap(maps.first);
  }

  @override
  Future<List> getAll() async {
      List<Map> maps = await db.query(productGroupTable,
        columns: [identifier, hotelId, productGroupId, description, display, code],
      );
      if(maps.length > 0) {
        return maps.map((map) => ProductGroup.fromMap(map)).toList();
      }
    return [];
  }

  @override
  insert(item) async {
    if(item is ProductGroup){
      try {
        item.identifier = await db.insert(productGroupTable, item.toMap());
      } catch (_){}
    }
  }

  @override
  void insertAll(List items) {
    if(items is List<ProductGroup>){
      for(ProductGroup item in items){
        insert(item);
      }
    }
  }

  @override
  void update(item) async {
    if(item is ProductGroup){
      try {
        await db.update(productGroupTable, item.toMap(), where: '$identifier = ?', whereArgs: [item.identifier]);
      } catch (_){

      }
    }
  }

  @override
  void remove(item) async {
    if(item is ProductGroup){
      try {
        await db.delete(productGroupTable, where: '$identifier = ?', whereArgs: [item.identifier]);
      } catch (_){

      }
    }
  }

  @override
  void removeAll(List items) {
    // TODO: implement removeAll
  }

  @override
  removeNoneExisting(List newItems) {
    // TODO: implement removeNoneExisting
    throw UnimplementedError();
  }

}