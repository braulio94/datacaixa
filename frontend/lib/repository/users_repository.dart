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
    await initStore();
    try{
      bool success = await userService.login(user);
      bool saved;
      if(success){
        saved = await Prefs.setLoggedInUser(user.userId);
      }
      print("SAVED: $saved WITH ${user.userId}");
      return success;
    }catch(_){}
    return null;
  }

  Future<User> getLoggedInUser() async {
    await initStore();
    try {
      int id = await Prefs.getLoggedInUser();
      if(id == null){
        throw ArgumentError;
      }
      print("LOGGED IN USER $id");
      return await store.userDao.get(id);
    } catch(_){
      return null;
    }

  }
}