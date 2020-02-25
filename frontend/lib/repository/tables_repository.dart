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
      tables = await store.tableDao.getAll();
    } catch (_){
      tables = await store.tableDao.getAll();
    }
    return tables;
  }
}