import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/screens/create_sale/create-sale-screen.dart';
import 'package:play_hq/screens/custom-address-search.dart';
import 'package:play_hq/screens/custom-map-screen.dart';
import 'package:play_hq/screens/custom-search-screen/main-search-screen.dart';
import 'package:play_hq/screens/order_tracking_screens/order_tracking_screen.dart';
import 'package:play_hq/screens/payment/payment-screen.dart';
import 'package:play_hq/screens/sale-details/sale-details-screen.dart';
import 'package:play_hq/screens/trades/create-trade-screen.dart';
import 'package:play_hq/screens/custom-search-screen.dart';
import 'package:play_hq/screens/game-details-screen.dart';
import 'package:play_hq/screens/main-screen.dart';
import 'package:play_hq/screens/nav-bar-screens/home-screen.dart';
import 'package:play_hq/screens/sign_up_screens/onboarding/setup-purchase-account-screen.dart';
import 'package:play_hq/screens/sign_up_screens/onboarding/setup-sales-account-screen.dart';
import 'package:play_hq/screens/sign_up_screens/sign-up-screen.dart';
import 'package:play_hq/screens/splash-screen.dart';
import 'package:play_hq/view-models/view_models.dart';


ImplSetupPurchaseAccount _implSetupPurchaseAccount = ImplSetupPurchaseAccount();
ImplSetupSales _implSetupSales = ImplSetupSales();

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HOME_SCREEN:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
    case SIGN_UP_SCREEN:
      return MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      );
    case MAIN_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<TabNavigationModel>(
          create: (context) => ImplTabNavigation(),
          child: MainScreen(),
        ),
      );
    case GAME_DETAILS_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<GameDetailsModel>(
          create: (context) => IGameDetailsModel(),
          child: GameDetailsScreen(),
        ),
      );
    case CREATE_TRADE_SCREEN:
      return MaterialPageRoute(
        builder: (context) => CreateTradeScreen(),
      );
    case PURCHASE_ACCOUNT_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<SetupPurchaseAccountModel>(
          create: (context) => _implSetupPurchaseAccount,
          child: SetupPurchaseAccountScreen(),
        ),
      );
    case SEARCH_SCREEN:
      return MaterialPageRoute(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider<SearchGameModel>(
              create: (context) => ImplSearchGames(),
            ),
            ChangeNotifierProvider<SetupPurchaseAccountModel>(
              create: (context) => _implSetupPurchaseAccount,
            ),
            ChangeNotifierProvider<SetupSalesModel>(
              create: (context) => _implSetupSales,
            ),
          ],
          child: CustomSearchScreen(values: settings.arguments as SearchGameScreens),
        ),
      );
    case CREATE_SALE_ROUTE:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<CreateSaleModel>(
          create: (context) => ImplCreateSale(),
          child: CreateSaleScreen(),
        ),
      );
    case SALE_DETAILS_ROUTE:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<SaleDetailsModel>(
          create: (context) => ImplSaleDetails(),
          child: SaleDetailsScreen(),
        ),
      );
    case SALES_ACCOUNT_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<SetupSalesModel>(
          create: (context) => _implSetupSales,
          child: SetupSalesAccountScreen(),
        ),
      );
    case CREATE_TRADE_SCREEN:
      return MaterialPageRoute(
        builder: (context) => CreateTradeScreen(),
      );
    case SPLASH_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<SplashScreenModel>(
          create: (context) => ImplSplash(),
          child: SplashScreen(),
        ),
      );
    case ORDER_TRACKING_SCREEN:
      return MaterialPageRoute(
        builder: (context) => OrderTrackingScreen(),
      );
    case MAIN_SEARCH_SCREEN:
      return MaterialPageRoute(
          builder: (context) => MultiProvider(providers: [
                ChangeNotifierProvider<CustomSearchModel>(
                  create: (context) => ImplCustomSearch(),
                ),
              ], child: MainSearchScreen(values: settings.arguments as SearchGameScreens)));

    case PAYMENT_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<PaymentModel>(
          create: (context) => ImplPayment(settings.arguments as String),
          child: PaymentScreen(),
        ),
      );

    case CUSTOM_ADDRESS_SEARCH_SCREEN:
      return MaterialPageRoute(
        builder: (context) => MultiProvider(providers: [
          ChangeNotifierProvider<CustomAddressSearchModel>(create: (context) => ImplCustomAddressSearch()),
          ChangeNotifierProvider<SetupSalesModel>(create: (context) => _implSetupSales),
        ], child: CustomAddressSearchScreen()),
      );

    case CUSTOM_MAP_SCREEN:
      return MaterialPageRoute(
          builder: (context) => MultiProvider(providers: [
                ChangeNotifierProvider<CustomMapModel>(create: (context) => ImplCustomMap()),
                ChangeNotifierProvider<SetupSalesModel>(create: (context) => _implSetupSales)
              ], child: CustomMapScreen()));

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Center(
              child: Text("ERROR", style: TextStyle(color: Colors.red)),
            ),
          ),
        ),
      );
  }
}
