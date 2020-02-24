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
  List<User> users = [];

  @observable
  User currentUser;

  @action
  select(User user) => currentUser = user;

  @action
  login() async {
    await repository.login(currentUser);
  }

  @action
  Future<User> getCurrentUser() async {
    return await repository.getLoggedInUser();
  }

  @action
  getUsers() async => users = await repository.loadUsers();
}