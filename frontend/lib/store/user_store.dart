import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/user_repository.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  UserRepository repository = UserRepository();

  @observable
  bool get connected => repository.connected;

  @observable
  List<User> users = [];

  @observable
  ObservableFuture<List<User>> futureUsers = emptyResponse;

  @computed
  bool get hasResults =>
      futureUsers != emptyResponse &&
          futureUsers.status == FutureStatus.fulfilled;

  static final ObservableFuture<List<User>> emptyResponse = ObservableFuture.value([]);

  @action
  getUsers() async {
    users = await repository.loadUsers();
  }
}