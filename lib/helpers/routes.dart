import 'package:flutter/material.dart';
import 'package:play_hq/constants/route_constants.dart';
import 'package:play_hq/screens/game_details_screen.dart';
import 'package:play_hq/screens/home_screen.dart';
import 'package:play_hq/screens/login_screen.dart';
import 'package:play_hq/screens/main_screen.dart';
import 'package:play_hq/screens/sign_up_screen.dart';
import 'package:play_hq/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LandingPageRoute:
        return MaterialPageRoute(builder: (context) => LandingScreen());
      case HomeRoute:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case SignUpRoute:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case SplashScreenRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case LoginRoute:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case MainScreenRoute:
        return MaterialPageRoute(builder: (context) => MainScreen());
      case GameDetailRoute:
        return MaterialPageRoute(builder: (context) => GameDetailsScreen());
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
NavBloc _navBloc = NavBloc();

// ignore: missing_return
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case SignUpRoute:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case SplashScreenRoute:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case MainScreenRoute:
      return MaterialPageRoute(
          builder: (context) =>
              Provider(create: (context) => _navBloc, child: MainScreen()));
    case GameDetailRoute:
      return MaterialPageRoute(builder: (context) => GameDetailsScreen());
    case CreateTradeRoute:
      return MaterialPageRoute(builder: (context) => CreateTradeScreen());
  }
}
