import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/store/user_store.dart';
import 'package:datacaixa/ui/user_login_page.dart';
import 'package:datacaixa/ui/user_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:datacaixa/ui/navigator.dart';

final UserStore store = UserStore();

class UserPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: store.getUsers(),
      builder: (context, _) {
        return Observer(
          builder: (_) {
            if(store.users.isEmpty){
              return Text(noUsers);
            } else {
              return ListView(
                physics: BouncingScrollPhysics(),
                children: store.users.map((user) =>
                    InkWell(
                      onTap: (){
                        store.select(user);
                        Navigator.of(context).push(createRoute(UserLoginPage()));
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