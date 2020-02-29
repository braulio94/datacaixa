import 'package:async/async.dart';
import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/users_repository.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  UsersRepository repository = UsersRepository();
  final AsyncMemoizer<User> _memoizer = AsyncMemoizer<User>();

  @computed
  bool get connected => repository.connected;

  @observable
  bool loginSuccess;

  @observable
  List<User> users = [];

  @observable
  User currentUser;

  User get user => currentUser;

  @action
  select(User user) => currentUser = user;

  @action
  setPassword(String password) => currentUser.password = password;

  @action
  Future<bool> login() async => loginSuccess = await repository.login(currentUser);

  @action
  Future<User> getCurrentUser() async => this._memoizer.runOnce(() async => currentUser = await repository.getLoggedInUser());

  @action
  getUsers() async => users = await repository.loadUsers();
}