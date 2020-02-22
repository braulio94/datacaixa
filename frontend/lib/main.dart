import 'package:datacaixa/models/user.dart';
import 'package:datacaixa/repository/user_repository.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserRepository userRepository;
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    userRepository = UserRepository();
    _initRepo();
  }

  _initRepo() async {
    await userRepository.store.connect();
    users = await userRepository.loadUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: Scaffold(
        body: ListView(
          children: users.map((user)=>
              Text(user.username, style: TextStyle(fontSize: 20))
          ).toList(),
        ),
      )
    );
  }
}