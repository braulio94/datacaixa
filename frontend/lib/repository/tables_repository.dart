import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/models/table.dart';
import 'package:datacaixa/repository/repository.dart';

class TablesRepository extends Repository {

  loadTables() async {
    await initStore();
    List<Table> tables = [];
    try {
      var newTables = await tableService.getTables();
      connected = true;
      await addNoneExisting(store.tableDao, newTables);
      await store.orderDao.removeNoneExisting(newTables);
      tables = await store.tableDao.getAll();
    } catch (_){
      tables = await store.tableDao.getAll();
    }
    return tables;
  }

  loadBusyTables() async {
    List<Table> busyTables = await loadTables();
    busyTables.retainWhere((t)=> t.status == busy);
    return busyTables;
  }
}