import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/common/style.dart';
import 'package:datacaixa/helpers/currency_value_helper.dart';
import 'package:datacaixa/models/product.dart';
import 'package:datacaixa/store/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: (){
                productStore.decrementPage();
              },
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.keyboard_arrow_left, color: timidColor),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Icon(Icons.maximize, color: timidColor, size: 30),
                ),
                Text(products.toUpperCase(), style: subTitleStyle),
              ],
            ),
            InkWell(
              onTap: (){
                productStore.incrementPage();
              },
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.keyboard_arrow_right, color: timidColor),
              ),
            ),
          ],
        ),
        Divider(),
        Expanded(
          child: FutureBuilder<List<Product>>(
            future: productStore.getProducts(),
            builder: (context, snapshot) =>
            snapshot.hasData ?
            Observer(
                builder: (context) {
                  return PageView(
                      controller: PageController(),
                      physics: NeverScrollableScrollPhysics(),
                      allowImplicitScrolling: true,
                      onPageChanged: (index){
                        if(index > productStore.page){
                          productStore.incrementPage();
                        } else {
                          productStore.incrementPage();
                        }
                      },
                      children: [
                        ListView(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.all(0),
                          children: productStore.products.map((Product product) =>
                              ListTile(
                                title: Text(product.description),
                                trailing: Text('${currencyFormatter.format(product.price)}'),
                                onTap: () async {
                                  if(orderStore.currentOrder == null){
                                    await orderStore.createNewOrder();
                                    await orderStore.createNewOrderItem(product);

                                  } else {
                                    orderStore.createNewOrderItem(product);
                                  }
                                  //productStore.changeDisplay();
                                  //productStore.restartMemorizer();
                                  //productStore.resetPage();
                                },
                              )).toList(),
                        ),
                      ]
                  );
                }
            ) : Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }
}
