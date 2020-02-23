import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserStore store = UserStore();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: store.getUsers(),
      builder: (context, snapshot) {
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
                      physics: BouncingScrollPhysics(),
                      children: snapshot.data.map((user) =>
                          ListTile(
                            leading: CircleAvatar(radius: 25),
                            title: Text(user.name, style: TextStyle(fontSize: 20)),
                            subtitle: Text(user.username, style: TextStyle(fontSize: 12))
                          )
                      ).toList(),
                    ),
                  ),
                ],
              );
            }
        });
      }
    );
  }
}
