import 'package:datacaixa/ui/tables_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TablesPage(),
      ),
    );
  }
}