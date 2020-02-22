import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/user_repository.dart';
import 'package:test/test.dart';

void main(){
  UserRepository userRepository = UserRepository();

  test('Add Load Users from repository test', () async {
    List<User> users = await userRepository.loadUsers();
    expect(users.length, 5);
  });
}