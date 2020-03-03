import 'package:datacaixa/common/api_routes.dart';
import 'package:datacaixa/models/order.dart';
import 'package:datacaixa/models/order_item.dart';
import 'package:datacaixa/models/product.dart';
import 'package:datacaixa/repository/repository.dart';

class OrderRepository extends Repository {
  getOrder(int id) async {
    await initStore();
    try{
      Order newOrder =  await orderService.getOrder(id, NO);
      await saveOrder(newOrder);
      return await storedOrder(id);
    } catch (_){
      return await storedOrder(id);
    }
  }

  saveOrder(Order newOrder) async {
    await store.orderDao.insert(newOrder);
    await store.clientDao.insert(newOrder.client);
  }

  Future<Order> storedOrder(int id) async {
    Order order = await store.orderDao.get(id);
    if(order.clientId != null){
      order.client = await store.clientDao.get(order.clientId);
    }
    return order;
  }

  loadOrderItems(int orderId) async {
    await initStore();
    List<OrderItem> items = <OrderItem>[];
    try{
      items =  await orderService.getOrderItems(orderId);
      await store.orderItemDao.insertAll(items);
      await saveProductItems(items);
      return await storedOrderItems(orderId);
    } catch (_){
      return storedOrderItems(orderId);
    }
  }

  saveProductItems(List<OrderItem> items) async {
    List<Product> products = items.map((i) => i.product).toList();
    await store.productDao.insertAll(products);
  }

  storedOrderItems(int orderId) async {
    List<OrderItem> items = await store.orderItemDao.getAllFromOrder(orderId);
    //List<Product> products = await store.productDao.getAllProducts(items);
    return List<OrderItem>.from(items.map((item) async => item.product = await store.productDao.get(item.productId)).toList());
  }
}