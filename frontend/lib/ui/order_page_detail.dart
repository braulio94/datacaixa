import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/common/style.dart';
import 'package:datacaixa/models/order.dart';
import 'package:datacaixa/store/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OrderPageDetail extends StatelessWidget {
  final int tableNumber;
  OrderPageDetail(this.tableNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (context){
            return Column(
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: secondaryColor),
                      onPressed: (){
                        Navigator.of(context).pop();
                      }
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: accentColor,
                        child: Text(
                          '${tableStore.currentTable.number}',
                          style: TextStyle(fontWeight: FontWeight.bold, color: neutralColor),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                orderStore.client,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: true,
                              ),
                            ),
                            Text(orderStore.openingDate, style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider()
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text(products),
        backgroundColor: accentColor,
        onPressed: (){

        },
      ),
    );
  }
}
