import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/screens/create-sale-screen.dart';
import 'package:play_hq/screens/create-trade-screen.dart';
import 'package:play_hq/screens/custom-search-screen.dart';
import 'package:play_hq/screens/game-details-screen.dart';
import 'package:play_hq/screens/main-screen.dart';
import 'package:play_hq/screens/nav-bar-screens/home-screen.dart';
import 'package:play_hq/screens/sign_up_screens/onboarding/setup-purchase-account-screen.dart';
import 'package:play_hq/screens/sign_up_screens/onboarding/setup-sales-account-screen.dart';
import 'package:play_hq/screens/sign_up_screens/sign-up-screen.dart';
import 'package:play_hq/screens/splash-screen.dart';
import 'package:play_hq/view-models/create-sale/create-sale-model.dart';
import 'package:play_hq/view-models/create-sale/impl-create-sale.dart';
import 'package:play_hq/view-models/navigation/impl-tab-navigation.dart';
import 'package:play_hq/view-models/navigation/tab-navigation-model.dart';
import 'package:play_hq/view-models/onboarding/setup-purchase-account-view-model/impl-purchase-account.dart';
import 'package:play_hq/view-models/onboarding/setup-purchase-account-view-model/purchase-account-model.dart';
import 'package:play_hq/view-models/search-game/impl-search-game.dart';
import 'package:play_hq/view-models/search-game/search-game-view-model.dart';
import 'package:play_hq/view-models/splash-screen/splash-screen-impl.dart';
import 'package:play_hq/view-models/splash-screen/splash-screen-model.dart';
import 'package:provider/provider.dart';

ImplSetupPurchaseAccount _implSetupPurchaseAccount = ImplSetupPurchaseAccount();

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HOME_SCREEN:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case SIGN_UP_SCREEN:
      return MaterialPageRoute(builder: (context) => SignUpScreen());

    case MAIN_SCREEN:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<TabNavigationModel>(
              create: (context) => ImplTabNavigation(), child: MainScreen()));

    case GAME_DETAILS_SCREEN:
      return MaterialPageRoute(builder: (context) => GameDetailsScreen());

    case CREATE_TRADE_SCREEN:
      return MaterialPageRoute(builder: (context) => CreateTradeScreen());

    case PURCHASE_ACCOUNT_SCREEN:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<SetupPurchaseAccountModel>(
              create: (context) => _implSetupPurchaseAccount, child: SetupPurchaseAccountScreen()));

    case SEARCH_SCREEN:
      return MaterialPageRoute(
          builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider<SearchGameModel>(
                  create: (context) => ImplSearchGames()),
              ChangeNotifierProvider<SetupPurchaseAccountModel>(
                  create: (context) => _implSetupPurchaseAccount),
            ],
              child: CustomSearchScreen(values: settings.arguments)
          ));

    case CREATE_SALE_ROUTE:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<CreateSaleModel>(
              create: (context) => ImplCreateSale(), child: CreateSaleScreen()));

    case SALES_ACCOUNT_SCREEN:
      return MaterialPageRoute(builder: (context) => SetupSalesAccountScreen());

    case SPLASH_SCREEN:
      return MaterialPageRoute(
          builder: (context) =>
              ChangeNotifierProvider<SplashScreenModel>(create: (context) => ImplSplash(), child: SplashScreen()));

    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                child: Center(
                  child: Text("ERROR", style: TextStyle(color: Colors.red)),
                ),
              )));
  }
}
