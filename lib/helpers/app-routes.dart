import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/screens/create_sale_screen.dart';
import 'package:play_hq/screens/create_trade_screen.dart';
import 'package:play_hq/screens/game_details_screen.dart';
import 'package:play_hq/screens/games_for_sale_screen.dart';
import 'package:play_hq/screens/home_screen.dart';
import 'package:play_hq/screens/landing_screen.dart';
import 'package:play_hq/screens/main_screen.dart';
import 'package:play_hq/screens/sale_details_screen.dart';
import 'package:play_hq/screens/sign_up_screens/select_games_screen.dart';
import 'package:play_hq/screens/sign_up_screens/sign_up_screen.dart';
import 'package:play_hq/screens/splash_screen.dart';
import 'package:play_hq/view-models/navigation/impl_tab_navigation.dart';
import 'package:play_hq/view-models/navigation/tab_navigation_model.dart';
import 'package:provider/provider.dart';


// ignore: missing_return
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HOME_SCREEN:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case SIGNUP_SCREEN:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case SPLASH_SCREEN:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case MAIN_SCREEN:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<TabNavigationModel>(
              create: (context) => ImplTabNavigation(),
              child: MainScreen()));
    case GAME_DETAILS_SCREEN:
      return MaterialPageRoute(builder: (context) => GameDetailsScreen());
    case CREATE_TRADE_SCREEN:
      return MaterialPageRoute(
          builder: (context) => CreateTradeScreen());
  }
}
