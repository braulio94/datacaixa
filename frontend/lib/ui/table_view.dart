import 'package:datacaixa/common/style.dart';
import 'package:datacaixa/helpers/currency_value_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datacaixa/models/table.dart' as model;

class TableView extends StatelessWidget {
  final model.Table table;
  final model.TableStatus status;

  TableView.busy(this.table) : status = model.TableStatus.Busy;

  TableView.idle(this.table) : status = model.TableStatus.Idle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 100, height: 100),
          child: DecoratedBox(
            decoration: BoxDecoration(color: status == model.TableStatus.Busy && table.hasOrder  ? accentColor :
              status == model.TableStatus.Busy ? timidColor :
              neutralColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, right: 14.8),
                    child: Text(
                      status == model.TableStatus.Idle || !table.hasOrder ?
                      '':'${currencyFormatter.format(table.totalAmount)}',
                      overflow: TextOverflow.visible,
                      style: boldBodyStyle.copyWith(color: neutralColor),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, bottom: 10),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: neutralColor,
                    foregroundColor: semiDarkColor,
                    child: Text(
                      '${table.number}',
                      style: boldBodyStyle,
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
