import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:datacaixa/models/product_group.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:datacaixa/common/contants.dart';

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
            "$productGroupId INTEGER, "
            "$description TEXT, "
            "$display TEXT, "
            "$code INTEGER)"
    );
    print("CREATED PRODUCT GROUP TABLE");
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
  void insert(item) async {
    if(item is ProductGroup){
      item.identifier = await db.insert(productGroupTable, item.toMap());
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
      await db.update(productGroupTable, item.toMap(),
          where: '$identifier = ?', whereArgs: [item.identifier]);
    }
  }

  @override
  void delete(item) async {
    if(item is ProductGroup){
      await db.delete(productGroupTable,
          where: '$identifier = ?', whereArgs: [item.identifier]);
    }
  }

}