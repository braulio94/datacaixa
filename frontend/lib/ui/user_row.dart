import 'package:datacaixa/models/user.dart';
import 'package:flutter/material.dart';

class UserRow extends StatelessWidget {
  final User user;
  UserRow(this.user);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(radius: 25),
        title: Text(user.name, style: TextStyle(fontSize: 20)),
        subtitle: Text(user.username, style: TextStyle(fontSize: 12))
    );
  }
}