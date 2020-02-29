import 'package:datacaixa/common/database_strings.dart';
import 'package:datacaixa/helpers/shared_preferences_helper.dart';
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
          child: FutureBuilder<int>(
            future: Prefs.getLoggedInUser(),
            builder: (context, snapshot) {
              print("Conn: ${snapshot.connectionState}");
              print("hasData: ${snapshot.hasData}");
              print('${snapshot.data}\n\n');
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