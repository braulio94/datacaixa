import 'package:datacaixa/common/contants.dart';
import 'package:datacaixa/database/database.dart';
import 'package:datacaixa/database/store_queries_helper.dart';

class StoreQueries implements StoreQueriesHelper {
  DataStore store = DataStore();

  @override
  void createProductTable() async {
    await store.db.execute(
        "CREATE TABLE TPRODUTOS "
            "($productId INTEGER, "
            "$description TEXT)"
    );
  }



}