import 'package:datacaixa/models/order.dart';
import 'package:datacaixa/repository/repository.dart';

class OrderRepository extends Repository {
  getOrder(int id) async {
    await initStore();
    Order order;
    try{
      if(id == null){
        throw ArgumentError;
      }
      Order newOrder =  await orderService.getOrder(id, 'yes');
      await saveOrder(newOrder);
      print("PASSOU $order");
      return newOrder;
    } catch (_){
      return await storedOrder(id);
    }
  }

  saveOrder(Order newOrder) async {
    await store.orderDao.insert(newOrder);
    await store.clientDao.insert(newOrder.client);
    await store.orderItemDao.insertAll(newOrder.orderItems);
    newOrder.orderItems.forEach((item) async => await store.productDao.insert(item.product));
  }

  Future<Order> storedOrder(int id) async {
    if(id == null){
      return null;
    }
    var order = await store.orderDao.get(id);
    if(order == null){
      return null;
    }
    if(order.clientId != null){
      order.client = await store.clientDao.get(order.clientId);
    }
    print(order.client.toString());
    order.orderItems = await store.orderItemDao.getAllFromOrder(order.orderId);
    for (int i = 0; i < order.orderItems.length; i++){
      order.orderItems[i].product = await store.productDao.get(order.orderItems[i].productId);
    }
    print('${order.toString()} \n\n\n');
    return order;
  }
}