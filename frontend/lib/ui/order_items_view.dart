import 'package:async/async.dart';
import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/common/database_strings.dart';
import 'package:datacaixa/common/style.dart';
import 'package:datacaixa/helpers/currency_value_helper.dart';
import 'package:datacaixa/models/order_item.dart';
import 'package:datacaixa/store/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OrderItemsView extends StatelessWidget {
  final AsyncMemoizer<List<OrderItem>> _memoizer = AsyncMemoizer<List<OrderItem>>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OrderItem>>(
      future: _memoizer.runOnce(() => orderStore.getOrderItems()),
      builder: (context, snapshot) {
        return Observer(builder: (context) =>
        orderStore.currentOrder == null && !orderStore.loading ?
          Center(child: Text(emptyList, style: titleStyle)):
          orderStore.currentOrder != null ?
          ListView(
            physics: BouncingScrollPhysics(),
            children: orderStore.observableItems.reversed.map((item) =>
              Dismissible(
                key: Key('${item.identifier}'),
                direction: DismissDirection.endToStart,
                onDismissed: (axis){

                },
                confirmDismiss: (axis) async {
                  bool sameUser = item.userId == userStore.currentUser.userId;
                  if(!sameUser){
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text(cannotDelete)));
                  }
                  return sameUser;
                },
                background: Container(color: accentColor),
                child: ListTile(
                  leading: Text(item.quantity == null ? '':'${item.quantity.floor()}'),
                  title: Text(item.product.description),
                  trailing: Text('${currencyFormatter.format(item.totalValue)}'),
                  subtitle: Text('${currencyFormatter.format(item.product.price)}', style: captionStyle),
                ),
              )
            ).toList()..insert(0,
              Dismissible(
                key: Key(orderItemId),
                direction: null,
                child: ListTile(
                  leading: Icon(Icons.filter_9_plus, color: darkColor),
                  title: Row(
                    children: [
                      Text(product, style: boldBodyStyle),
                      Padding(
                        padding: EdgeInsets.only(left: 4, bottom: 8),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: accentColor, //borderRadius: BorderRadius.circular(25),
                            shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text('${orderStore.observableItems.length}', style: overlineStyle.copyWith(color: neutralColor)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Text(totalAmount, style: boldBodyStyle),
                ),
              ),
            ),
          ): Center(child: CircularProgressIndicator()),
        );
      }
    );
  }
}