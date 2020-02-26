import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/helpers/date_helper.dart';
import 'package:datacaixa/models/order.dart';
import 'package:mobx/mobx.dart';
part 'order_store.g.dart';

class OrderStore = _OrderStore with _$OrderStore;

abstract class _OrderStore with Store {
  @observable
  Order currentOrder;

  @computed
  String get client  => currentOrder == null ||
                  currentOrder.client == null ?
                    defaultClient : currentOrder.client;
  @computed
  String get openingDate => currentOrder == null ?
                      dateFormatter.format(DateTime.now()):
                        currentOrder.openingDate;
}