import 'package:datacaixa/main.dart';
import 'package:datacaixa/ui/table_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  AnimationLimiter(
          child: GridView.count(
            physics: BouncingScrollPhysics(),
            crossAxisCount: 3,
            children: List.generate(
              100, (int index) {
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 300),
                  columnCount: 50,
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: TableView(
                        index
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}