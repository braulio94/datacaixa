import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/repository.dart';

class UserRepository extends Repository {

  loadUsers(){
    List<User> users = store.userDao.getAll() as List<User>;
    addNotExisting(users);
  }

  addNotExisting(List<User> users){

  }
}