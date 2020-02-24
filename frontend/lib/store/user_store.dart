import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/user_repository.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  UserRepository repository = UserRepository();

  @computed
  bool get connected => repository.connected;

  @observable
  bool loginSuccess;

  @observable
  List<User> users = [];

  @computed
  User currentUser;

  @action
  select(User user) => currentUser = user;

  @action
  setPassword(String password) => currentUser.password = password;

  @action
  Future<bool> login() async => loginSuccess = await repository.login(currentUser);

  @action
  Future<User> getCurrentUser() async => await repository.getLoggedInUser();

  @action
  getUsers() async => users = await repository.loadUsers();
}