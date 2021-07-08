import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/screens/create_trade_screen.dart';
import 'package:play_hq/screens/game_details_screen.dart';
import 'package:play_hq/screens/main_screen.dart';
import 'package:play_hq/screens/nav-bar-screens/home_screen.dart';
import 'package:play_hq/screens/sign_up_screens/onboarding/select-game-type-screen.dart';
import 'package:play_hq/screens/sign_up_screens/sign_up_screen.dart';
import 'package:play_hq/screens/splash_screen.dart';
import 'package:play_hq/view-models/navigation/impl_tab_navigation.dart';
import 'package:play_hq/view-models/navigation/tab_navigation_model.dart';
import 'package:play_hq/view-models/select-game-types-view-model/impl-select-game-types.dart';
import 'package:play_hq/view-models/select-game-types-view-model/select-game-types-model.dart';
import 'package:play_hq/view-models/splash-screen/splash-screen-impl.dart';
import 'package:play_hq/view-models/splash-screen/splash-screen-model.dart';
import 'package:provider/provider.dart';


// ignore: missing_return
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HOME_SCREEN:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case SIGN_UP_SCREEN:
      return MaterialPageRoute(builder: (context) => SignUpScreen());

    case MAIN_SCREEN:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<TabNavigationModel>(
              create: (context) => ImplTabNavigation(),
              child: MainScreen()));

    case GAME_DETAILS_SCREEN:
      return MaterialPageRoute(builder: (context) => GameDetailsScreen());

    case CREATE_TRADE_SCREEN:
      return MaterialPageRoute(builder: (context) => CreateTradeScreen());

    case GAME_TYPE_SCREEN:
      return MaterialPageRoute(builder: (context) => ChangeNotifierProvider<SelectGameTypesModel>(
          create: (context) => ImplSelectGameTypes(),
          child: GameTypes()));

    default:
      return MaterialPageRoute(builder: (context) => ChangeNotifierProvider<SplashScreenModel>(
          create: (context) => ImplSplash(),
          child: SplashScreen()));
  }
}
