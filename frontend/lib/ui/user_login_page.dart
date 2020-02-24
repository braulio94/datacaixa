import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/ui/user_page.dart';
import 'package:datacaixa/ui/user_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UserLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) =>
          Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  UserRow(store.currentUser),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: TextField(
                      onChanged: (password) => store.setPassword(password),
                      onSubmitted: (value) => store.login(),
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: passwordHint,
                      ),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: RaisedButton(
              onPressed: (){
                store.login();
              },
              child: Text(login),
            ),
          ),
    );
  }
}