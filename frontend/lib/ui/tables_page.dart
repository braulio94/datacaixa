import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/common/style.dart';
import 'package:datacaixa/store/app_state.dart';
import 'package:datacaixa/ui/navigator.dart';
import 'package:datacaixa/ui/order_page_detail.dart';
import 'package:datacaixa/ui/table_view.dart';
import 'package:flutter/material.dart';
import 'package:datacaixa/models/table.dart' as table;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TablesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(tables, style: titleStyle),
                  Spacer(),
                  Switch(
                    activeColor: accentColor,
                    value: tableStore.showAllTables,
                    onChanged: (bool newValue) async {
                      tableStore.changeTablesDisplay();
                      tableStore.clear();
                      tableStore.showAllTables ? await tableStore.getTables() : await tableStore.getBusyTables();
                    },
                  ),
                  Text(tableStore.showAllTables ? all:busyTables, style: overlineStyle),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<table.Table>>(
                  future: tableStore.showAllTables ? tableStore.getTables() : tableStore.getBusyTables(),
                  builder: (context, snapshot) =>
                  tableStore.tables.isNotEmpty ?
                  AnimationLimiter(
                    child: GridView.count(
                      physics: BouncingScrollPhysics(),
                      crossAxisCount: 3,
                      children: List.generate(tableStore.tables.length, (int index) {
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          columnCount: 1,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: InkWell(
                                onTap: () async {
                                  tableStore.select(tableStore.table(index));
                                  orderStore.reset();
                                  Navigator.of(context).push(createRoute(OrderPageDetail()));
                                },
                                child: tableStore.status(index) == table.TableStatus.Busy ?
                                TableView.busy(tableStore.table(index)):
                                TableView.idle(tableStore.table(index)),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ): Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        );
      }
    );
  }
}
