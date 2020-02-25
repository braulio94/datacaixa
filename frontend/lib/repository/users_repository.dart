import 'package:datacaixa/helpers/shared_preferences_helper.dart';
import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/repository.dart';

class UsersRepository extends Repository {

  loadUsers() async {
    await initStore();
    try {
      List<User> newUsers = await userService.getUsers();
      connected = true;
      await addNoneExisting(store.userDao, newUsers);
      await removeNoneExisting(store.userDao, newUsers);
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
    await initStore();
    try {
      int id = await SharedPreferencesHelper.getLoggedInUser();
      return await store.userDao.get(id);
    } catch(_){}
    return null;
  }
}