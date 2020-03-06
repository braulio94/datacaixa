import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/helpers/date_helper.dart';
import 'package:datacaixa/models/order.dart';
import 'package:datacaixa/models/order_item.dart';
import 'package:mobx/mobx.dart';
import '../repository/order_repository.dart';
part 'order_store.g.dart';

class OrderStore = _OrderStore with _$OrderStore;

abstract class _OrderStore with Store {
  OrderRepository repository = OrderRepository();
  @observable
  bool loading = false;

  @observable
  List<OrderItem> orderItems = <OrderItem>[];

  @observable
  Order currentOrder;

  @computed
  String get client  => currentOrder != null &&
                          currentOrder.client != null ?
                            currentOrder.client.name :
                              currentOrder != null &&
                                currentOrder.client == null ?
                                  defaultClient : '';
  @computed
  String get openingDate => currentOrder == null ?
                '': dateFormatter.format(DateTime.parse(currentOrder.openingDate));

  @action
  newCurrentOrder(){
    currentOrder = null;
    orderItems = <OrderItem>[];
  }

  @action
  Future<Order> getOrder(int id) async => currentOrder = await repository.getOrder(id);

  Future<List<OrderItem>> getOrderItems() async {
    if(currentOrder != null){
      loading = true;
      return orderItems = await repository.loadOrderItems(currentOrder.orderId);
    }
    loading = false;
    return orderItems;
  }
}