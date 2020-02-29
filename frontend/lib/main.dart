import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/store/app_state.dart';
import 'package:datacaixa/ui/home_page.dart';
import 'package:datacaixa/ui/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Datacaixa());

class Datacaixa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Datacaixa',
      home: Scaffold(
        body: SafeArea(
          child: FutureBuilder<User>(
            future: userStore.getCurrentUser(),
            builder: (context, snapshot) {
              return snapshot.hasData ? HomePage() :
              !snapshot.hasData && snapshot.connectionState == ConnectionState.waiting ?
              Center(child: CircularProgressIndicator()) : UserPage();
            }
          ),
        ),
      )
    );
  }
}