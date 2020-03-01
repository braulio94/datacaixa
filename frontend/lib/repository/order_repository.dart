import 'package:datacaixa/models/order.dart';
import 'package:datacaixa/models/order_item.dart';
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
      order = await store.orderDao.insert(newOrder);
      order.client = await store.clientDao.insert(newOrder.client);
      //await saveOrderItems(order.orderItems);
      //order =  await store.orderDao.get(id);
      //order.orderItems = await store.orderItemDao.getAllFromOrder(order.identifier);
      print("PASSOU");
      print('${order.toString()} \n\n\n');
      return newOrder;
    } catch (_){
      if(id == null){
        return null;
      }
      order =  await store.orderDao.get(id);
      order.client = await store.clientDao.get(order.clientId);
      order.orderItems = await store.orderItemDao.getAllFromOrder(order.identifier);
      return order;
    }
  }

  saveOrderItems(List<OrderItem> items) async {
    if(items != null && items.isNotEmpty){
      await addNoneExisting(store.orderItemDao, items);
    }
  }
}