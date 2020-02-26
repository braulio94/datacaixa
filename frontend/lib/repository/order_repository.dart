import 'package:datacaixa/models/order.dart';
import 'package:datacaixa/repository/repository.dart';

class OrderRepository extends Repository {
  getOrder(int id) async {
    await initStore();
    try{
      Order newOrder = await orderService.getOrder(id, 'no');
      print("NEW ORDER: $newOrder");
      await store.orderDao.insert(newOrder);
      return await store.orderDao.get(id);
    } catch (_){
      return await store.orderDao.get(id);
    }
  }
}