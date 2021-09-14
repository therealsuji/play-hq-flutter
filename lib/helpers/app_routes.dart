import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_strings.dart';

import 'package:play_hq/screens/screens.dart';
import 'package:play_hq/view_models/view_models.dart';


ISetupPurchaseAccountModel _implSetupPurchaseAccount = ISetupPurchaseAccountModel();
ISetupSalesModel _implSetupSales = ISetupSalesModel();

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
          create: (context) => ITabNavigationModel(),
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
              create: (context) => ISearchGamesModel(),
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
          create: (context) => ICreateSaleModel(),
          child: CreateSaleScreen(),
        ),
      );
    case SALE_DETAILS_ROUTE:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<SaleDetailsModel>(
          create: (context) => ISaleDetailsModel(),
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
          create: (context) => ISplashModel(),
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
                  create: (context) => ICustomSearchModel(),
                ),
              ], child: MainSearchScreen(values: settings.arguments as SearchGameScreens)));

    case PAYMENT_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<PaymentModel>(
          create: (context) => ImplPaymentModel(settings.arguments as String),
          child: PaymentScreen(),
        ),
      );

    case CUSTOM_ADDRESS_SEARCH_SCREEN:
      return MaterialPageRoute(
        builder: (context) => MultiProvider(providers: [
          ChangeNotifierProvider<CustomAddressSearchModel>(create: (context) => ICustomAddressSearchModel()),
          ChangeNotifierProvider<SetupSalesModel>(create: (context) => _implSetupSales),
        ], child: CustomAddressSearchScreen()),
      );

    case CUSTOM_MAP_SCREEN:
      return MaterialPageRoute(
          builder: (context) => MultiProvider(providers: [
                ChangeNotifierProvider<CustomMapModel>(create: (context) => ICustomMapModel()),
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