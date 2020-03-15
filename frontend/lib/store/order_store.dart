import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/helpers/date_helper.dart';
import 'package:datacaixa/models/order.dart';
import 'package:datacaixa/models/order_item.dart';
import 'package:datacaixa/models/product.dart';
import 'package:datacaixa/store/app_state.dart';
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
  ObservableList<OrderItem> observableItems = ObservableList<OrderItem>();

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

  @computed
  bool get isFirstItem => observableItems.length <= 1;

  @action
  addOrderItem(Product product) async {

  }

  @action
  createNewOrder() async {
    Order newOrder = Order.add(userId: userStore.currentUser.userId, tableId: tableStore.currentTable.tableId, openingDate: '${DateTime.now()}');
    currentOrder = await repository.createOrder(newOrder);
  }

  @action
  createNewOrderItem(Product product) async {
    OrderItem newItem = OrderItem.add(productId: product.productId, product: product, userId: userStore.currentUser.userId, unitValue: product.price);
    if(currentOrder.hasOrderId){
      newItem.orderId = currentOrder.orderId;
    }
    newItem = await repository.createOrderItem(newItem);
    if(newItem != null){
      observableItems.add(newItem);
    }
    if(currentOrder.hasOrderId){
      await getOrder(currentOrder.orderId);
    }
  }

  @action
  reset(){
    currentOrder = null;
    observableItems = ObservableList<OrderItem>();
  }

  @action
  Future<Order> getOrder(int id) async => currentOrder = await repository.getOrder(id);

  Future<ObservableList<OrderItem>> getOrderItems() async {
    if(currentOrder != null){
      loading = true;
      orderItems = await repository.loadOrderItems(currentOrder.orderId);
      observableItems.clear();
      observableItems.addAll(orderItems);
    }
    loading = false;
    return observableItems;
  }
}