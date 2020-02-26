import 'package:datacaixa/common/style.dart';
import 'package:flutter/material.dart';
import 'package:datacaixa/models/table.dart' as model;

class TableView extends StatelessWidget {
  final model.Table table;
  final model.TableStatus status;

  TableView.busy(this.table) :
        status = model.TableStatus.Busy;

  TableView.idle(this.table) :
        status = model.TableStatus.Idle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 100, height: 100),
          child: DecoratedBox(
            decoration: BoxDecoration(color: status == model.TableStatus.Idle ?
              neutralColor : accentColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    status == model.TableStatus.Idle ?
                    '' : '${table.totalAmount}',
                    style: TextStyle(fontSize: 10, color: Colors.black45),
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: neutralColor,
                    child: Text(
                      '${table.number}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: accentColor
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
