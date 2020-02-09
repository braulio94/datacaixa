import 'package:datacaixa/common/contants.dart';
import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:datacaixa/models/user.dart';
import 'package:sqflite/sqlite_api.dart';

class UserDao implements DaoHelper {
  Database db;
  UserDao(this.db);

  @override
  void createTable(Database database) async {
    await database.execute(
        "CREATE TABLE $userTable "
            "($identifier INTEGER PRIMARY KEY AUTOINCREMENT, "
            "$hotelId INTEGER, "
            "$userId INTEGER, "
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
  Future<List> getAll() async {
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
  void insert(item) async {
    if(item is User){
      item.identifier = await db.insert(userTable, item.toMap());
    }
  }

  @override
  void insertAll(List items) async {
    if(items is List<User>){
      for(User item in items){
        insert(item);
      }
    }
  }

  @override
  void update(item) async {
    if(item is User){
      await db.update(userTable, item.toMap(),
          where: '$identifier = ?', whereArgs: [item.identifier]);
    }
  }

  @override
  void delete(item) async {
    if(item is User){
      await db.delete(userTable,
          where: '$identifier = ?', whereArgs: [item.identifier]);
    }
  }
}