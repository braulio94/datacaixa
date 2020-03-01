import 'package:async/async.dart';
import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/common/style.dart';
import 'package:datacaixa/models/order.dart';
import 'package:datacaixa/store/app_state.dart';
import 'package:datacaixa/ui/order_items_view.dart';
import 'package:datacaixa/ui/product_groups_view.dart';
import 'package:datacaixa/ui/products_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OrderPageDetail extends StatefulWidget {

  @override
  _OrderPageDetailState createState() => _OrderPageDetailState();
}

class _OrderPageDetailState extends State<OrderPageDetail> with TickerProviderStateMixin {
  Animation<int> _chars;
  int _stringIndex;
  AnimationController controller;
  static const List<String> _kStrings = const <String>['....','...','...'];
  String get _currentString => _kStrings[_stringIndex % _kStrings.length];
  var _memoizer = AsyncMemoizer<Order>();

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  _startAnimation() async {
    controller = new AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    setState(() {
      _stringIndex = _stringIndex == null ? 0 : _stringIndex + 1;
      _chars = new StepTween(begin: 0, end: _currentString.length)
          .animate(new CurvedAnimation(parent: controller, curve: Curves.easeIn));
    });
    await controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    _memoizer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Order>(
          future: this._memoizer.runOnce(() async => orderStore.getOrder(tableStore.currentTable.orderId)),
          builder: (context, snapshot) {
            return Observer(
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
                                  child: snapshot.connectionState == ConnectionState.waiting ? AnimatedBuilder(
                                    animation: _chars,
                                    builder: (BuildContext context, Widget child) {
                                      String text = _currentString.substring(0, _chars.value);
                                      return new Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400));
                                    },
                                  ):
                                  Text(
                                    '${orderStore.client}',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true,
                                  ),
                                ),
                                Text(snapshot.connectionState == ConnectionState.waiting ?
                                '':'${orderStore.openingDate}', style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Expanded(
                      child: OrderItemsView(),
                    )
                  ],
                );
              },
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text(products),
        backgroundColor: accentColor,
        onPressed: (){
          showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
            return Observer(
                builder: (context) {
                return productStore.showProducts ? ProductsView() : ProductGroupsView();
              }
            );
          }).whenComplete((){
            if(productStore.showProducts){
              productStore.restartMemorizer();
              productStore.resetPage();
              productStore.changeDisplay();
            }
          });
        },
      ),
    );
  }
}
