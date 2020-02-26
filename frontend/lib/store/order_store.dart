import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/helpers/date_helper.dart';
import 'package:datacaixa/models/order.dart';
import 'package:mobx/mobx.dart';
part 'order_store.g.dart';

class OrderStore = _OrderStore with _$OrderStore;

abstract class OrderStore with Store {
  @observable
  Order currentOrder;

  @computed
  client get => currentOrder == null &&
                  currentOrder.client == null ?
                    defaultClient : currentOrder.client;
  @computed
  openingDate get currentOrder == null ?
                      dateFormatter.format(DateTime.now()):
                        currentOrder.openingDate;
}