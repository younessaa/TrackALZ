import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class AnimationRoute {
  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 400}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeThroughTransition(
          animation: animation,
          child: child,
          secondaryAnimation: secondaryAnimation,
        );
      },
    );
  }
}
