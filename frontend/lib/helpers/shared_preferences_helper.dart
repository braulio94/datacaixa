import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final String _userId = "id_usuario";
  static Future<int> getLoggedInUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_userId) ?? 0;
  }

  static Future<bool> setLoggedInUser(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setInt(_userId, value);
  }
}