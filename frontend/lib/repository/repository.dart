import 'package:datacaixa/database/database.dart';
import 'package:datacaixa/services/client_service.dart';
import 'package:datacaixa/services/order_service.dart';
import 'package:datacaixa/services/product_service.dart';
import 'package:datacaixa/services/table_service.dart';
import 'package:datacaixa/services/user_service.dart';

class Repository {
  bool connected = false;
  DataStore store = DataStore();
  ProductService productService = ProductService();
  OrderService orderService = OrderService();
  TableService tableService = TableService();
  ClientService clientService = ClientService();
  UserService userService = UserService();
}