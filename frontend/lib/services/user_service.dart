import 'dart:convert';

import 'package:datacaixa/common/api_routes.dart';
import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/services/base_service.dart';
import 'package:http/http.dart';

class UserService extends BaseService {

  login() async {
    //TODO implement this method
  }

  getUser(int id) async {
    Response response = await client.get(BASE_URL + USER + '/$id');
    return User.fromJson(jsonDecode(response.body)["usuario"]);
  }

  getUsers() async {
    Response response = await client.get(BASE_URL + USERS);
    return List<User>.from(json.decode(response.body)["usuarios"].map((x) => User.fromJson(x)));
  }
}