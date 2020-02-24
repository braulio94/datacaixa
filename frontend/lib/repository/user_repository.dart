import 'package:datacaixa/helpers/shared_preferences_helper.dart';
import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/repository.dart';

class UserRepository extends Repository {

  loadUsers() async {
    await initDao();
    try {
      List<User> newUsers = await userService.getUsers();
      connected = true;
      await _addNoneExisting(newUsers);
      await _removeNoneExisting(newUsers);
      return await store.userDao.getAll();
    } catch(_) {
      return await store.userDao.getAll();
    }
  }

  Future<bool> login(User user) async {
    try{
      bool success = await userService.login(user);
      connected = true;
      if(success){
        SharedPreferencesHelper.setLoggedInUser(user.userId);
      }
      print("LOGIN: $success");
      return success;
    }catch(_){}
    return null;
  }

  Future<User> getLoggedInUser() async {
    await initDao();
    try {
      int id = await SharedPreferencesHelper.getLoggedInUser();
      return await store.userDao.get(id);
    } catch(_){}
    return null;
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