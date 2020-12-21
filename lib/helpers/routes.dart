import 'package:flutter/material.dart';
import 'package:play_hq/blocs/createSaleBloc.dart';
import 'package:play_hq/blocs/nav_bloc.dart';
import 'package:play_hq/blocs/sign_up_bloc.dart';
import 'package:play_hq/blocs/sign_up_bloc.dart';
import 'package:play_hq/blocs/tradingBloc/create_trade_bloc.dart';
import 'package:play_hq/constants/route_constants.dart';
import 'package:play_hq/screens/create_sale_screen.dart';
import 'package:play_hq/screens/create_trade_screen.dart';
import 'package:play_hq/screens/game_details_screen.dart';
import 'package:play_hq/screens/games_for_sale_screen.dart';
import 'package:play_hq/screens/home_screen.dart';
import 'package:play_hq/screens/landing_screen.dart';
import 'package:play_hq/screens/login_screen.dart';
import 'package:play_hq/screens/main_screen.dart';
import 'package:play_hq/screens/sale_details_screen.dart';
import 'package:play_hq/screens/sign_up_screens/sign_up_onboard_screen.dart';
import 'package:play_hq/screens/sign_up_screens/sign_up_onboard_screen.dart';
import 'package:play_hq/screens/sign_up_screens/sign_up_screen.dart';
import 'package:play_hq/screens/splash_screen.dart';
import 'package:provider/provider.dart';

NavBloc _navBloc = NavBloc();
CreateTradeBloc _tradeBloc = CreateTradeBloc();

// ignore: missing_return
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case SignUpRoute:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case SignUpOnBoardRoute:
      return MaterialPageRoute(
          builder: (context) => Provider<SignUpBloc>(
                create: (context) => SignUpBloc(),
                dispose: (_, bloc) => bloc.dispose(),
                child: SignUpOnBoardScreen(),
              ));
    case SplashScreenRoute:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case LandingPageRoute:
      return MaterialPageRoute(builder: (context) => LandingScreen());
    case MainScreenRoute:
      return MaterialPageRoute(
          builder: (context) => Provider<NavBloc>(
                create: (context) => _navBloc,
                child: MainScreen(),
              ));
    case GameDetailRoute:
      return MaterialPageRoute(builder: (context) => GameDetailsScreen());
    case CreateTradeRoute:
      return MaterialPageRoute(
          builder: (context) => Provider(
                create: (context) => _tradeBloc,
                child: CreateTradeScreen(),
              ));
    case GamesForSaleRoute:
      return MaterialPageRoute(builder: (context) => GamesForSaleScreen());
    case CreateSaleRoute:
      return MaterialPageRoute(
          builder: (context) => Provider<CreateSaleBloc>(
                create: (context) => CreateSaleBloc(),
                dispose: (_, bloc) => bloc.dispose(),
                child: CreateSaleScreen(),
              ));
    case SaleDetailsRoute:
      return MaterialPageRoute(builder: (context) => SaleDetails());
  }
}
