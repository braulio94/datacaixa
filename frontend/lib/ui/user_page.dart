import 'package:datacaixa/common/app_strings.dart';
import 'package:datacaixa/store/user_store.dart';
import 'package:datacaixa/ui/user_login_page.dart';
import 'package:datacaixa/ui/user_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final UserStore store = UserStore();

class UserPage extends StatelessWidget {

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => UserLoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve)).animate(animation);

        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

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
                        Navigator.of(context).push(_createRoute());
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