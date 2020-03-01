import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/common/style.dart';
import 'package:datacaixa/models/product_group.dart';
import 'package:datacaixa/store/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductGroupsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Icon(Icons.maximize, color: timidColor, size: 30),
            ),
            Text(categories.toUpperCase(), style: subTitleStyle),
            Divider(),
            Expanded(
              child: FutureBuilder<List<ProductGroup>>(
                future: productStore.getGroups(),
                builder: (context, snapshot) =>
                  snapshot.hasData ?
                  ListView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    children: snapshot.data.map((ProductGroup group) =>
                      ListTile(
                        title: Text(group.description),
                        onTap: (){
                          productStore.selectGroup(group.productGroupId);
                          productStore.changeDisplay();
                        },
                      )).toList(),
                  ) : Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        );
      }
    );
  }
}
