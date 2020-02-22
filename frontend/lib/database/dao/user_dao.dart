import 'package:datacaixa/common/contants.dart';
import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:datacaixa/models/user.dart';
import 'package:sqflite/sqlite_api.dart';

class UserDao implements DaoHelper {
  Database db;
  UserDao(Database database){
    this.db = database;
  }

  UserDao.createTable(Database database){
    createTable(database);
  }

  @override
  void createTable(Database database) async {
    await database.execute(
        "CREATE TABLE $userTable "
            "($identifier INTEGER PRIMARY KEY AUTOINCREMENT, "
            "$hotelId INTEGER, "
            "$userId INTEGER UNIQUE, "
            "$username TEXT, "
            "$name TEXT, "
            "$password TEXT, "
            "$email TEXT)"
    );
    print("CREATED USER TABLE");
  }

  @override
  Future get(int id) async {
      List<Map> maps = await db.query(userTable,
          columns: [
            identifier,
            hotelId,
            userId,
            username,
            name,
            password,
            email,
          ],
          where: '$identifier = ?',
          whereArgs: [id]
      );
      if(maps.length > 0)
        return User.fromMap(maps.first);
  }

  @override
  Future<List<User>> getAll() async {
      List<Map> maps = await db.query(userTable,
        columns: [
          identifier,
          hotelId,
          userId,
          username,
          name,
          password,
          email,
        ],
      );
      if(maps.length > 0) {
        return maps.map((map) => User.fromMap(map)).toList();
      }
    return [];
  }

  @override
  insert(item) async {
    if(item is User){
      try {
        item.identifier = await db.insert(userTable, item.toMap());
      } catch (_){}
    }
  }

  @override
  insertAll(List items) async {
    if(items is List<User>){
      for(User item in items){
        insert(item);
      }
    }
  }

  @override
  update(item) async {
    if(item is User){
      await db.update(userTable, item.toMap(), where: '$identifier = ?', whereArgs: [item.identifier]);
    }
  }

  @override
  remove(item) async {
    if(item is User){
      await db.delete(userTable, where: '$identifier = ?', whereArgs: [item.identifier]);
    }
  }

  @override
  removeAll(List items) async {
    if(items is List<User>){
      for(User item in items){
        remove(item);
      }
    }
  }
}