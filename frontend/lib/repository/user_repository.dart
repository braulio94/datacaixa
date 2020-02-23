import 'package:datacaixa/helpers/shared_preferences_helper.dart';
import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/repository.dart';

class UserRepository extends Repository {

  loadUsers() async {
    await initDao();
    try {
      List<User> newUsers = await userService.getUsers();
      await _addNoneExisting(newUsers);
      await _removeNoneExisting(newUsers);
      connected = true;
      return await store.userDao.getAll();
    } catch(_) {
      return await store.userDao.getAll();
    }
  }

  login(User user) async {
    bool success = await userService.login(user);
    if(success){
      SharedPreferencesHelper.setLoggedInUser(user.userId);
    }
  }

  getLoggedInUser() async {
    int id = await SharedPreferencesHelper.getLoggedInUser();
    try {
      return await store.userDao.get(id);
    } catch(_){}
  }

  _addNoneExisting(List<User> list) async {
    await store.userDao.insertAll(list);
  }

  _removeNoneExisting(List<User> newUsers) async {
    await store.userDao.removeNoneExisting(newUsers);
  }

  initDao() async {
    if(store.userDao == null){
      await store.connect();
    }
  }
}