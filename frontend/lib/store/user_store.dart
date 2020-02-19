import 'package:datacaixa/models/user.dart';
import 'package:mobx/mobx.dart';
//part 'user_store.g.dart';

//class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {

  _UserStore(this.user);

  ObservableList<User> users = ObservableList<User>();

  @observable
  ObservableFuture<bool> isLoggedIn = ObservableFuture.value(false);

  @observable
  ObservableFuture<List<User>> fetchUsers = emptyResponse;

  @observable
  User user;

  static ObservableFuture<List<User>> emptyResponse = ObservableFuture.value([]);



  @action
  login(String password) async {

  }

  getUsers() {

  }
}