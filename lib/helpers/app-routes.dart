import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/screens/create_sale/create-sale-screen.dart';
import 'package:play_hq/screens/custom-address-search.dart';
import 'package:play_hq/screens/custom-search-screen/main-search-screen.dart';
import 'package:play_hq/screens/order_tracking_screens/order_tracking_screen.dart';
import 'package:play_hq/screens/payment/payment-screen.dart';
import 'package:play_hq/screens/trades/create-trade-screen.dart';
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
import 'package:play_hq/view-models/custom-address-search/custom-address-search-model.dart';
import 'package:play_hq/view-models/custom-address-search/impl-custom-address-search.dart';
import 'package:play_hq/view-models/custom-search/custom-search-model.dart';
import 'package:play_hq/view-models/custom-search/impl-custom-search.dart';
import 'package:play_hq/view-models/game_details/game_details_model.dart';
import 'package:play_hq/view-models/game_details/i_game_details_model.dart';
import 'package:play_hq/view-models/navigation/impl-tab-navigation.dart';
import 'package:play_hq/view-models/navigation/tab-navigation-model.dart';
import 'package:play_hq/view-models/onboarding/setup-purchase-account-view-model/impl-purchase-account.dart';
import 'package:play_hq/view-models/onboarding/setup-purchase-account-view-model/purchase-account-model.dart';
import 'package:play_hq/view-models/onboarding/setup-sales-account-view-model/impl-sales-account.dart';
import 'package:play_hq/view-models/onboarding/setup-sales-account-view-model/sales-account-model.dart';
import 'package:play_hq/view-models/payment/impl-payment-model.dart';
import 'package:play_hq/view-models/payment/payment-model.dart';
import 'package:play_hq/view-models/search-game/impl-search-game.dart';
import 'package:play_hq/view-models/search-game/search-game-view-model.dart';
import 'package:play_hq/view-models/splash-screen/splash-screen-impl.dart';
import 'package:play_hq/view-models/splash-screen/splash-screen-model.dart';
import 'package:provider/provider.dart';

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
        builder: (context) => ChangeNotifierProvider<IGameDetailsModel>(
          create: (context) => GameDetails(),
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
          child: CustomSearchScreen(
              values: settings.arguments as SearchGameScreens),
        ),
      );
    case CREATE_SALE_ROUTE:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<CreateSaleModel>(
          create: (context) => ImplCreateSale(),
          child: CreateSaleScreen(),
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
          builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider<CustomSearchModel>(
                      create: (context) => ImplCustomSearch(),
                    ),
                  ],
                  child: MainSearchScreen(
                      values: settings.arguments as SearchGameScreens)));

    case PAYMENT_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<PaymentModel>(
          create: (context) => ImplPayment(settings.arguments as String),
          child: PaymentScreen(),
        ),
      );

    case CUSTOM_MAP_SEARCH_SCREEN:
      return MaterialPageRoute(
        builder: (context) => MultiProvider(providers: [
          ChangeNotifierProvider<CustomAddressSearchModel>(
              create: (context) => ImplCustomAddressSearch()),
          ChangeNotifierProvider<SetupSalesModel>(
              create: (context) => _implSetupSales),
        ], child: CustomAddressSearchScreen()),
      );
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
