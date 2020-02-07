import 'package:datacaixa/database/database.dart';
import 'package:datacaixa/database/helper.dart';
import 'package:datacaixa/database/dao/order_dao.dart';
import 'package:datacaixa/models/order.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: MyHomePage(title: 'Counter App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  DataStore store;

  @override
  void initState() {
    super.initState();
    store = DataStore();
    _initialiseDatabase();
  }

  _initialiseDatabase() async {
    var db = await store.connect();
    print("IS DATABASE OPEN? ${db.isOpen}");
    store.orderDao.insert(
      Order.add(
        hotelId: 1,
        orderId: 12,
        userId: 1,
        clientId: 1,
        tableId: 1,
        employeeId: 1,
        openingDate: '2019-02-10',
        totalAmount: 2000.20,
        people: 2,
        status: 'Aberto',
        tableStatus: 'Ocupada',
        type: 'MESA',
      )
    );
  }

  void _incrementCounter() async {
    Order order = await store.orderDao.get(4);
    print("ORDER ${order.toString()}");
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              key: Key('counter'),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}