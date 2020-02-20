import 'package:datacaixa/repository/user_repository.dart';
import 'package:test/test.dart';

void main(){
  UserRepository userRepository = UserRepository();

  test('Add Load Users from repository test', () async {
    await userRepository.loadUsers();
    expect(userRepository.users.length, 5);
  });
}