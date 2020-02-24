import 'package:datacaixa/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (context) {
            return Card(
              margin: EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                height: 200,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(userStore.currentUser.name),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}