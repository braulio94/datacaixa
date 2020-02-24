import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Card(
          margin: EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            height: 200,
          ),
        ),
      ),
    );
  }
}