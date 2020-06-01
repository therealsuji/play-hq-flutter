import 'package:flutter/material.dart';
import 'package:play_hq/constants/route_constants.dart';
import 'package:play_hq/screens/home_screen.dart';
import 'package:play_hq/screens/login_screen.dart';
import 'package:play_hq/screens/sign_up_screen.dart';
import 'package:play_hq/screens/splash_screen.dart';
import 'package:provider/provider.dart';


class MyRoutes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeRoute:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case SignUpRoute:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case SplashScreenRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case LoginRoute:
        return MaterialPageRoute(builder: (context) => LoginScreen());
    }
  }
}
