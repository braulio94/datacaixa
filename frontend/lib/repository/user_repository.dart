import 'package:datacaixa/data/mock_data.dart';
import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/repository.dart';

class UserRepository extends Repository {

  List<User> users = [];

  loadUsers() async {
    users = mockUsers;
    try {
      var newUsers = await userService.getUsers();
      _removeExisting(newUsers);
      _addNoneExisting(newUsers);
    } catch(_) {
      users = mockUsers;
    }
  }

  _addNoneExisting(List<User> list) {
    printUsers();
    users.retainWhere((item) => item.userId == null);
    printUsers();
    users.addAll(list);
    printUsers();
  }

  _removeExisting(List<User> list) {

  }

  printUsers(){
    for(User user in users){
      print('USER: ${user.username}\n');
    }
    print("=======================================\n");
  }

  isNew(User user){
    return users.where((u) => u.userId != user.userId);
  }
}