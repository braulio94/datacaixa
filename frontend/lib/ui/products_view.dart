import 'package:datacaixa/models/product.dart';
import 'package:datacaixa/store/app_state.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: productStore.getProducts(),
        builder: (context, snapshot) =>
        snapshot.hasData && snapshot.connectionState == ConnectionState.done ?
        snapshot.data.map((Product product){
          return ListTile(
            title: Text(product.description),
          );
        }) : CircularProgressIndicator()

    );
  }
}
