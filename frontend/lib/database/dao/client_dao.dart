import 'package:datacaixa/common/database_strings.dart';
import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:datacaixa/models/client.dart';
import 'package:sqflite/sqlite_api.dart';

class ClientDao implements DaoHelper {
  Database db;
  ClientDao(this.db);


  ClientDao.createTable(Database database){
    createTable(database);
  }

  @override
  void createTable(Database database) async {
    await database.execute(
        "CREATE TABLE $clientTable "
            "($identifier INTEGER PRIMARY KEY AUTOINCREMENT, "
            "$clientId INTEGER, "
            "$name TEXT, "
            "$phoneNumber TEXT, "
            "$gender TEXT)"
    );
    print("CREATED CLIENT TABLE");
  }

  @override
  Future get(int id) async {
      List<Map> maps = await db.query(clientTable,
          columns: [
            identifier,
            clientId,
            name,
            phoneNumber,
            gender,
          ],
          where: '$identifier = ?',
          whereArgs: [id]
      );
      if(maps.length > 0)
        return Client.fromMap(maps.first);
  }

  @override
  Future<List> getAll() async {
      List<Map> maps = await db.query(clientTable,
        columns: [
          identifier,
          clientId,
          name,
          phoneNumber,
          gender,
        ],
      );
      if(maps.length > 0) {
        return maps.map((map) => Client.fromMap(map)).toList();
      }
    return [];
  }

  @override
  void insert(item) async {
    if(item is Client){
      item.identifier = await db.insert(clientTable, item.toMap());
    }
  }

  @override
  void insertAll(List items) async {
    if(items is List<Client>){
      for(Client item in items){
        insert(item);
      }
    }
  }

  @override
  void update(item) async {
    if(item is Client){
      await db.update(clientTable, item.toMap(),
          where: '$identifier = ?', whereArgs: [item.identifier]);
    }
  }

  @override
  void remove(item) async {
    if(item is Client){
      await db.delete(clientTable,
          where: '$identifier = ?', whereArgs: [item.identifier]);
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