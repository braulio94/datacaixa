
import 'package:datacaixa/database/database.dart';
import 'package:datacaixa/services/order_service.dart';
import 'package:datacaixa/services/product_service.dart';

class Repository {
  DataStore store = DataStore();
  ProductService productService = ProductService();
  OrderService orderService = OrderService();

  Repository(){
    store.connect();
  }
}