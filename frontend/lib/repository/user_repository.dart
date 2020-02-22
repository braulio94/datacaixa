import 'package:datacaixa/data/mock_data.dart';
import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/repository.dart';

class UserRepository extends Repository {

  loadUsers() async {
    try {
      List<User> newUsers = await userService.getUsers();
      await _addNoneExisting(newUsers);
      await _removeNoneExisting(newUsers);
      return store.userDao.getAll();
    } catch(_) {
      print("COULD NOT LOAD");
      return await store.userDao.getAll();
    }
  }

  _addNoneExisting(List<User> list) async {
    await store.userDao.insertAll(list);
  }

  _removeNoneExisting(List<User> newUsers) async {
    await store.userDao.removeNoneExisting(newUsers);
  }
}