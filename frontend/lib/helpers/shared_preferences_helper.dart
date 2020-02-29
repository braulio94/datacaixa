import 'package:datacaixa/common/database_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<int> getLoggedInUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(userId);
  }

  static Future<bool> setLoggedInUser(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(userId, value);
  }

  static Future<String> getProductsOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(productsOrder ?? 'sales');
  }

  static Future<bool> setProductsOrder(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(productsOrder, value);
  }
}