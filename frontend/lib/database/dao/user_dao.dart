import 'package:datacaixa/common/database_strings.dart';
import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:datacaixa/models/user.dart';
import 'package:sqflite/sqlite_api.dart';

class UserDao implements DaoHelper {
  Database db;
  UserDao(this.db);

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
  }

  @override
  Future get(int id) async {
      try {
        List<Map> maps = await db.query(userTable,
            columns: [identifier, hotelId, userId, username, name, password, email],
            where: '$userId = ?',
            whereArgs: [id]
        );
        print("LOGGED IN USER $id");
        if(maps.length > 0)
          return User.fromMap(maps.first);
      } catch(_){}
      return null;
  }

  @override
  getAll() async {
    try {
      List<Map> maps = await db.query(
        userTable,
        columns: [identifier, hotelId, userId, username, name, password, email],
      );
      if(maps.length > 0) {
        return maps.map((map) => User.fromMap(map)).toList();
      }
    } catch(_){
      return [];
    }
  }

  @override
  insert(item) async {
    if(item is User){
      try {
        item.identifier = await db.insert(userTable, item.toMap());
      } catch (_){
        //TODO update here an already existing item
      }
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
  removeNoneExisting(List list) async {
    if(list is List<User>){
      List<int> ids = list.map((u) => u.userId != null ? u.userId : -1).toList();
      try {
        await db.delete(
          userTable,

          where: '$userId NOT IN (${ids.join(', ')})',
        );
      } catch(_){}
    }
  }
  
  @override
  remove(item) async {
    if(item is User){
      try {
        await db.delete(
            userTable,
            where: '$identifier = ?',
            whereArgs: [item.identifier]
        );
      } catch(_){}
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