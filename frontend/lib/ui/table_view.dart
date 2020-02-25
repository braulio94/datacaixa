import 'package:datacaixa/common/style.dart';
import 'package:flutter/material.dart';

class TableView extends StatelessWidget {
  final int number;

  TableView(this.number);

  TableView.busy(this.number);

  TableView.idle(this.number);

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
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '$number',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: accentColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
