import 'package:datacaixa/common/contants.dart';
import 'package:datacaixa/database/store_queries_helper.dart';

class StoreQueries implements StoreQueriesHelper {

  @override
  void createProductTable(db) async {
    await db.execute(
        "CREATE TABLE TPRODUTOS "
            "($productId INTEGER, "
            "$description TEXT)"
    );
  }
}