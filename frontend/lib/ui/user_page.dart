import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/store/app_state.dart';
import 'package:datacaixa/ui/user_login_page.dart';
import 'package:datacaixa/ui/user_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:datacaixa/ui/navigator.dart';

class UserPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userStore.getUsers(),
      builder: (context, _) {
        return Observer(
          builder: (_) {
            if(userStore.users == null){
              return Center(child: Text(noUsers));
            } else {
              return ListView(
                physics: BouncingScrollPhysics(),
                children: userStore.users.map((user) =>
                    InkWell(
                      onTap: (){
                        userStore.select(user);
                        Navigator.of(context).pushReplacement(createRoute(UserLoginPage()));
                      },
                      child: UserRow(user),
                    ),
                ).toList(),
              );
            }
        });
      }
    );
  }
}