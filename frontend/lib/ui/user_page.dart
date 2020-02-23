
import 'dart:math';

import 'package:datacaixa/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserStore store = UserStore();
  @override
  void initState() {
    super.initState();
    store.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if(store.users.isEmpty){
          return Text('Não existe usuarios!');
        } else {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Visibility(
                  visible: !store.connected,
                  child: Icon(Icons.refresh)
                ),
              ),
              Expanded(
                child: ListView(
                  children: store.users.map((user) =>
                      Text(user.username, style: TextStyle(fontSize: 20, color: user.userId == null ? Colors.red : Colors.black54))
                  ).toList(),
                ),
              ),
            ],
          );
        }
    });
  }
}
