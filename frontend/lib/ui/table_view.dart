import 'package:datacaixa/common/style.dart';
import 'package:flutter/material.dart';
import 'package:datacaixa/models/table.dart' as model;

class TableView extends StatelessWidget {
  final model.Table table;
  final Widget child;

  TableView.busy(this.table) : child = Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          '${table.number}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: accentColor),
        ),
      ),
      Expanded(child: Container()),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          '${table.totalAmount}',
          style: TextStyle(fontSize: 10, color: Colors.black45),
        ),
      ),
    ],
  );

  TableView.idle(this.table) : child = Padding(
    padding: EdgeInsets.all(10),
    child: Text(
      '${table.number}',
      style: TextStyle(
          fontWeight: FontWeight.bold, color: accentColor),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 100, height: 100),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.white),
            child: child,
          ),
        ),
      ),
    );
  }
}
