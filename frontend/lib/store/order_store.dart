import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/helpers/date_helper.dart';
import 'package:datacaixa/models/order.dart';
import 'package:mobx/mobx.dart';
import '../repository/order_repository.dart';
part 'order_store.g.dart';

class OrderStore = _OrderStore with _$OrderStore;

abstract class _OrderStore with Store {
  OrderRepository repository = OrderRepository();
  @observable
  bool loading = false;

  @observable
  Order currentOrder;

  @computed
  String get client  => currentOrder != null &&
                          currentOrder.client.name != null ?
                            currentOrder.client.name :
                              currentOrder != null &&
                                currentOrder.client.name == null ?
                                  defaultClient : '';
  @computed
  String get openingDate => currentOrder == null ?
                '': dateFormatter.format(DateTime.parse(currentOrder.openingDate));

  @action
  newCurrentOrder() => currentOrder = null;

  @action
  Future<Order> getOrder(int id) async {
    loading = true;
    currentOrder = await repository.getOrder(id);
    loading = false;
    return currentOrder;
  }
}