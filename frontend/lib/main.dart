import 'package:datacaixa/helpers/shared_preferences_helper.dart';
import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/store/user_store.dart';
import 'package:datacaixa/ui/home_page.dart';
import 'package:datacaixa/ui/user_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(Datacaixa());

final UserStore store = UserStore();

class Datacaixa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: Scaffold(
        body: FutureBuilder<User>(
          future: store.getCurrentUser(),
          builder: (context, snapshot) =>
            snapshot.data == null ?
            UserPage() :
            HomePage()
        )
      )
    );
  }
}