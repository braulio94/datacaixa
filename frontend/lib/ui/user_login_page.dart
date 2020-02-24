import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/main.dart';
import 'package:datacaixa/ui/home_page.dart';
import 'package:datacaixa/ui/navigator.dart';
import 'package:datacaixa/ui/user_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UserLoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  _validate() async {
    if(userStore.currentUser.password != null){
      await userStore.login().whenComplete((){
        _formKey.currentState.validate();
      });
    } else {
      _formKey.currentState.validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) =>
          Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  UserRow(userStore.currentUser),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        onChanged: (password) => userStore.setPassword(password),
                        onFieldSubmitted: (value) => _validate(),
                        validator: (value){
                          if (value.isEmpty) {
                            return passwordEmpty;
                          } else if(userStore.loginSuccess == null){
                            return notConnected;
                          } else if(userStore.loginSuccess != null && !userStore.loginSuccess){
                            return wrongPassword;
                          }
                          Navigator.of(context).pushReplacement(createRoute(HomePage()));
                          return null;
                        },
                        //onSubmitted: (value) => store.login(),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: passwordHint,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              child: RaisedButton(
                color: Colors.blue,
                padding: EdgeInsets.all(25),
                onPressed: () {
                  _validate();
                },
                child: Text(login, style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
    );
  }
}