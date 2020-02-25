import 'package:datacaixa/database/dao/dao_helper.dart';
import 'package:datacaixa/database/database.dart';
import 'package:datacaixa/services/client_service.dart';
import 'package:datacaixa/services/order_service.dart';
import 'package:datacaixa/services/product_service.dart';
import 'package:datacaixa/services/table_service.dart';
import 'package:datacaixa/services/user_service.dart';

class Repository {
  bool connected = false;
  DataStore store;
  ProductService productService = ProductService();
  OrderService orderService = OrderService();
  TableService tableService = TableService();
  ClientService clientService = ClientService();
  UserService userService = UserService();

  initStore() async {
    if(store == null){
      store = DataStore();
      store.connect();
    }
  }

  addNoneExisting(DaoHelper dao, List<dynamic> list) async {
    await dao.insertAll(list);
  }

  removeNoneExisting(DaoHelper dao, List<dynamic> newUsers) async {
    await dao.removeNoneExisting(newUsers);
  }
}