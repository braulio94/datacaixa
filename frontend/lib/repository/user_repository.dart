import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/repository.dart';

class UserRepository extends Repository {
  List<User> users = [];

  loadUsers() async {
    try {
      List<User> newUsers = await userService.getUsers();
      await _addNoneExisting(newUsers);
    } catch(_) {
      users = await store.userDao.getAll();
    }
  }

  _addNoneExisting(List<User> list) async {
    store.userDao.insertAll(list);
    users = await store.userDao.getAll();
  }
}