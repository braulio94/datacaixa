import 'package:datacaixa/common/database_strings.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesBuilder<T> extends StatelessWidget {
  final String pref;
  final AsyncWidgetBuilder<T> builder;

  const SharedPreferencesBuilder({
    Key key,
    @required this.pref,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: _future(),
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          return this.builder(context, snapshot);
        });
  }

  Future<T> _future() async {
    return (await SharedPreferences.getInstance()).get(pref);
  }
}
class Prefs {
  static Future<int> getLoggedInUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(userId);
  }

  static Future<bool> setLoggedInUser(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(userId, value);
  }
}