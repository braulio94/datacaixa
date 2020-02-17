import 'dart:convert';
import 'package:datacaixa/models/client.dart' as c;
import 'package:datacaixa/common/api_routes.dart';
import 'package:datacaixa/services/base_service.dart';
import 'package:http/http.dart';

class ClientService extends BaseService {

  getClient(int id) async {
    Response response = await client.get(BASE_URL + CLIENT + '/$id') ;
    return c.Client.fromJson(json.decode(response.body)['cliente']);
  }

  getClients(int page) async {
    var uri = Uri.http(HOST, CLIENTS , {PAGE: '$page'});
    Response response = await client.get(uri) ;
    return List<c.Client>.from(json.decode(response.body)["clientes"].map((x) => c.Client.fromJson(x)));
  }

  searchClient(String name) async {
    Response response = await client.get(BASE_URL + CLIENTS + SEARCH + '/$name') ;
    return List<c.Client>.from(json.decode(response.body)["clientes"].map((x) => c.Client.fromJson(x)));
  }
}
