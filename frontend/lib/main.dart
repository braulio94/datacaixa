import 'package:datacaixa/database/database.dart';
import 'package:datacaixa/models/order.dart';
import 'package:datacaixa/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  UserRepository userRepository;
  MyApp(){
    userRepository = UserRepository();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: Scaffold(
        body: ListView(
          children: userRepository.users.map((user)=>
              Text(user.username, style: TextStyle(fontSize: 20))
          ).toList(),
        ),
      )
    );
  }
}