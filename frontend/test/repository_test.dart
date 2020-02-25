import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/users_repository.dart';
import 'package:test/test.dart';

void main(){
  UsersRepository userRepository = UsersRepository();

  test('Add Load Users from repository test', () async {
    List<User> users = await userRepository.loadUsers();
    expect(users.length, 5);
  });
}