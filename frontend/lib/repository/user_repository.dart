import 'package:datacaixa/data/mock_data.dart';
import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/repository.dart';

class UserRepository extends Repository {

  List<User> users = [];

  loadUsers() async {
    users = mockUsers;
    try {
      var newUsers = await userService.getUsers();
      _addNoneExisting(newUsers);
      _removeExisting(newUsers);
    } catch(_) {
      users = mockUsers;
    }
  }

  _addNoneExisting(List<User> list) {
    for(User user in users) {
      list.retainWhere((item) => item.userId != user.userId);
    }
    users.addAll(list);
  }

  _removeExisting(List<User> list) {

  }
}