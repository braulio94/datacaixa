import 'dart:convert';
import 'package:datacaixa/common/api_routes.dart';
import 'package:datacaixa/models/table.dart';
import 'package:datacaixa/services/base_service.dart';
import 'package:http/http.dart';

class TableService extends BaseService {

  getTable(int id) async {
    var uri = Uri.http(HOST, TABLE + '/$id');
    Response response = await client.get(uri);
    return Table.fromJson(json.decode(response.body)["mesa"]);
  }

  getTables() async {
    var uri = Uri.http(HOST, TABLES);
    Response response = await client.get(uri);
    return List<Table>.from(json.decode(response.body)["mesas"].map((x) => Table.fromJson(x)));
  }
}