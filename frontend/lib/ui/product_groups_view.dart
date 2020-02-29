import 'package:datacaixa/models/product_group.dart';
import 'package:datacaixa/store/app_state.dart';
import 'package:flutter/material.dart';

class ProductGroupsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productStore.getGroups(),
      builder: (context, snapshot) =>
        snapshot.hasData && snapshot.connectionState == ConnectionState.done ?
        snapshot.data.map((ProductGroup group){
          return ListTile(
            title: Text(group.description),
          );
        }) : CircularProgressIndicator()

    );
  }
}
