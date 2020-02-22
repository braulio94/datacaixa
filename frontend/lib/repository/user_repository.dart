import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/repository.dart';

class UserRepository extends Repository {
  List<User> users = [];

  loadUsers() async {
    try {
      List<User> newUsers = await userService.getUsers();
      await _addOrRemoveNoneExisting(newUsers);
    } catch(_) {
      print("COULD NOT LOAD");
      users = await store.userDao.getAll();
    }
  }

  _addOrRemoveNoneExisting(List<User> list) async {
    await store.userDao.insertAll(list);
    users = await store.userDao.getAll();
    await _removeExisting(list);
    users = await store.userDao.getAll();
  }

  _removeExisting(List<User> newUsers) async {
    List<User> oldUsers = users;
    if(newUsers.isNotEmpty) {
      for (User user in newUsers) {
        oldUsers.retainWhere((item) => item.userId != null && user.userId != item.userId);
      }
      await store.userDao.removeAll(oldUsers);
    }
  }
}