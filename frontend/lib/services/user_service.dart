import 'dart:convert';
import 'package:datacaixa/common/api_routes.dart';
import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/services/base_service.dart';
import 'package:http/http.dart';

class UserService extends BaseService {

  login(User user) async {
    Response response = await client.post(BASE_URL + USER + LOGIN, body: json.encode(user.toJson()));
    bool success = jsonDecode(response.body)["usuario"];
    return success;
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