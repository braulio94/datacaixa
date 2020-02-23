import 'package:datacaixa/helpers/shared_preferences_helper.dart';
import 'package:datacaixa/ui/user_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(Datacaixa());

class Datacaixa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: Scaffold(
        body: FutureBuilder<int>(
          future: SharedPreferencesHelper.getLoggedInUser(),
          builder: (context, snapshot) =>
            snapshot.data == 0 ?
            UserPage() :
            Card()
        )
      )
    );
  }
}