import 'package:flutter/material.dart';

Route createRoute(Widget nextPage) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => nextPage,
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