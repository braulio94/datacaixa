import 'package:datacaixa/ui/user_page.dart';
import 'package:datacaixa/ui/user_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UserLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) =>
              Column(
                children: <Widget>[
                  UserRow(store.currentUser),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Senha'
                      ),
                    ),
                  )
                ],
              ),
        ),
      ),
    );
  }
}