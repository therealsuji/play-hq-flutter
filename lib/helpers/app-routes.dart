import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/screens/create-trade-screen.dart';
import 'package:play_hq/screens/custom-search-screen.dart';
import 'package:play_hq/screens/game-details-screen.dart';
import 'package:play_hq/screens/main-screen.dart';
import 'package:play_hq/screens/nav-bar-screens/home-screen.dart';
import 'package:play_hq/screens/sign_up_screens/onboarding/setup-purchase-account-screen.dart';
import 'package:play_hq/screens/sign_up_screens/onboarding/setup-sales-account-screen.dart';
import 'package:play_hq/screens/sign_up_screens/sign-up-screen.dart';
import 'package:play_hq/screens/splash-screen.dart';
import 'package:play_hq/view-models/navigation/impl-tab-navigation.dart';
import 'package:play_hq/view-models/navigation/tab-navigation-model.dart';
import 'package:play_hq/view-models/onboarding/setup-purchase-account-view-model/impl-purchase-account.dart';
import 'package:play_hq/view-models/onboarding/setup-purchase-account-view-model/purchase-account-model.dart';
import 'package:play_hq/view-models/splash-screen/splash-screen-impl.dart';
import 'package:play_hq/view-models/splash-screen/splash-screen-model.dart';
import 'package:provider/provider.dart';

ImplSelectGameTypes _implSelectGameTypes = ImplSelectGameTypes();

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

    case PURCHASE_ACCOUNT_SCREEN:
      return MaterialPageRoute(builder: (context) => ChangeNotifierProvider<SelectGameTypesModel>(
          create: (context) => _implSelectGameTypes,
          child: SetupPurchaseAccount()));

    case SEARCH_SCREEN:
      return MaterialPageRoute(builder: (context) => ChangeNotifierProvider<SelectGameTypesModel>(
          create: (context) => _implSelectGameTypes,
          child: CustomSearchScreen()));

    case SALES_ACCOUNT_SCREEN:
      return MaterialPageRoute(builder: (context) => SetupSalesAccountScreen());

    default:
      return MaterialPageRoute(builder: (context) => ChangeNotifierProvider<SplashScreenModel>(
          create: (context) => ImplSplash(),
          child: SplashScreen()));
  }
}