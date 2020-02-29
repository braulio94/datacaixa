import 'package:datacaixa/helpers/currency_value_helper.dart';
import 'package:datacaixa/models/table.dart';
import 'package:datacaixa/repository/tables_repository.dart';
import 'package:mobx/mobx.dart';

part 'table_store.g.dart';

class TableStore = _TableStore with _$TableStore;

abstract class _TableStore with Store {
  TablesRepository repository = TablesRepository();
  @observable
  bool showAllTables = true;
  @observable
  List<Table> tables = [];
  @observable
  Table currentTable;

  changeTablesDisplay() => showAllTables = !showAllTables;

  TableStatus status(index) =>
      tables[index].status == 'Ocupada' ?
      TableStatus.Busy : TableStatus.Idle;

  table(index) => tables[index];
  select(Table table) => currentTable = table;

  @action
  clear() => tables = [];

  @action
  Future<List<Table>> getTables() async => tables = await repository.loadTables();

  @action
  Future<List<Table>> getBusyTables() async => tables = await repository.loadBusyTables();
}