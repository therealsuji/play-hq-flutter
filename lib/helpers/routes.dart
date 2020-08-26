import 'package:flutter/material.dart';
import 'package:play_hq/blocs/nav_bloc.dart';
import 'package:play_hq/constants/route_constants.dart';
import 'package:play_hq/screens/game_details_screen.dart';
import 'package:play_hq/screens/home_screen.dart';
import 'package:play_hq/screens/login_screen.dart';
import 'package:play_hq/screens/main_screen.dart';
import 'package:play_hq/screens/sign_up_screen.dart';
import 'package:play_hq/screens/splash_screen.dart';
import 'package:provider/provider.dart';

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
  }
}
