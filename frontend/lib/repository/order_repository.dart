import 'package:datacaixa/repository/repository.dart';

class OrderRepository extends Repository {
  getOrder(int id) async {
    await initStore();
    try{
      if(id == null){
        throw ArgumentError;
      }
      return await orderService.getOrder(id, 'no');
      //await store.orderDao.insert(newOrder);
      //return await store.orderDao.get(id);
    } catch (_){
      return null;
    }
  }
}