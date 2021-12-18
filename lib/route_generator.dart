import 'package:flutter/material.dart';
import 'package:trackalz/views/account/sign_up.dart';
import 'package:trackalz/views/account/sign_in.dart';
import 'package:trackalz/views/home.dart';
import 'package:trackalz/views/init_app/splash.dart';
import 'animations/animation_route.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return AnimationRoute.fadeThrough(settings, (context) {
      switch (settings.name) {
        case '/Splash':
          return Splash();
        case '/Home':
          return Home();
        case '/SignIn':
          return SignIn();
        case '/SignUp':
          return SignUp();
        default:
          return SizedBox.shrink();
      }
    });
  }
}
