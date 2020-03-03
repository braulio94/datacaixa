import 'package:async/async.dart';
import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/common/style.dart';
import 'package:datacaixa/helpers/currency_value_helper.dart';
import 'package:datacaixa/models/order_item.dart';
import 'package:datacaixa/store/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OrderItemsView extends StatelessWidget {
  AsyncMemoizer<List<OrderItem>> _memoizer = AsyncMemoizer<List<OrderItem>>();
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
            children: orderStore.orderItems.map((item) =>
              ListTile(
                leading: Text('${item.quantity.floor()}'),
                title: Text(item.product.description),
                trailing: Text('${currencyFormatter.format(item.totalValue)}'),
                subtitle: Text('${currencyFormatter.format(item.product.price)}', style: captionStyle),
              )
            ).toList()..insert(0,
              ListTile(
                leading: Icon(Icons.filter_9_plus, color: darkColor),
                title: Text(product, style: boldBodyStyle),
                trailing: Text(totalAmount, style: boldBodyStyle),
              ),
            ),
          ): Center(child: CircularProgressIndicator()),
        );
      }
    );
  }
}