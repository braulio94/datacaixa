import 'package:datacaixa/common/style.dart';
import 'package:datacaixa/store/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TablePageDetail extends StatelessWidget {
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
                    Text(
                      '${tableStore.currentTable.number}',
                      style: TextStyle(fontWeight: FontWeight.bold, color: accentColor),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
