import 'package:flutter/material.dart';
import 'package:play_hq/models/search_model/search_argument_model.dart';
import 'package:play_hq/screens/order_details/order_details_screen.dart';
import 'package:play_hq/screens/profile_screens/notifications/notification_screen.dart';
import 'package:play_hq/screens/profile_screens/settings_screen.dart';
import 'package:play_hq/screens/sign_up_screens/auth_flow_screens/authentication_screen.dart';
import 'package:play_hq/screens/sign_up_screens/onboarding/app_onboarding/main_onboarding.dart';
import 'package:play_hq/view_models/authentication/authentication_model.dart';
import 'package:play_hq/view_models/authentication/i_authentication_model.dart';
import 'package:play_hq/view_models/main_onboarding/i_main_onboarding_model.dart';
import 'package:play_hq/view_models/main_onboarding/main_onboarding_model.dart';
import 'package:play_hq/view_models/orders/active_orders_view_model/active_orders_view_model.dart';
import 'package:play_hq/view_models/orders/active_orders_view_model/i_active_orders_view_model.dart';
import 'package:play_hq/view_models/profile/main_profile/i_main_profile_model.dart';
import 'package:play_hq/view_models/profile/main_profile/main_profile_model.dart';
import 'package:provider/provider.dart';

import 'package:play_hq/helpers/app_strings.dart';

import 'package:play_hq/screens/screens.dart';
import 'package:play_hq/view_models/view_models.dart';

ISetupPurchaseAccountModel _implSetupPurchaseAccount = ISetupPurchaseAccountModel();
ISetupSalesModel _implSetupSales = ISetupSalesModel();
ICreateSaleModel _implCreateSale = ICreateSaleModel();

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HOME_SCREEN:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
    case MAIN_SCREEN:
      return MaterialPageRoute(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider<TabNavigationModel>(
              create: (context) => ITabNavigationModel(),
            ),
            ChangeNotifierProvider<HomeScreenModel>(
              create: (context) => IHomeScreenModel(),
            ),
            ChangeNotifierProvider<MainProfileModel>(
              create: (context) => IMainProfileModel(),
            ),
            ChangeNotifierProvider<ActiveOrdersViewModel>(
              create: (context) => IActiveOrdersViewModel(),
            ),
          ],
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
    case CREATE_SALE_ROUTE:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<CreateSaleModel>(
          create: (context) => _implCreateSale,
          child: CreateSaleScreen(),
        ),
      );
    case MY_SALES_ROUTE:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<MySalesModel>(
          create: (context) => IMySalesModel(),
          child: MySalesScreen(),
        ),
      );
    case BUY_GAMES_ROUTE:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<BuyGamesModel>(
          create: (context) => IBuyGamesModel(),
          child: MySalesScreen(),
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
        builder: (context) => ChangeNotifierProvider<SetupSalesViewModel>(
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
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider<CustomSearchModel>(
              create: (context) => ICustomSearchModel(),
            ),
            ChangeNotifierProvider<SetupPurchaseAccountModel>(
              create: (context) => _implSetupPurchaseAccount,
            ),
            ChangeNotifierProvider<SetupSalesViewModel>(
              create: (context) => _implSetupSales,
            ),
            ChangeNotifierProvider<CreateSaleModel>(
              create: (context) => _implCreateSale,
            ),
          ],
          child: MainSearchScreen(values: settings.arguments as SearchArguments),
        ),
      );
    case PAYMENT_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<PaymentModel>(
          create: (context) => ImplPaymentModel(settings.arguments as String),
          child: PaymentScreen(),
        ),
      );
    case CUSTOM_ADDRESS_SEARCH_SCREEN:
      return MaterialPageRoute(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider<CustomAddressSearchModel>(
              create: (context) => ICustomAddressSearchModel(),
            ),
            ChangeNotifierProvider<SetupSalesViewModel>(
                create: (context) => _implSetupSales),
          ],
          child: CustomAddressSearchScreen(),
        ),
      );
    case CUSTOM_MAP_SCREEN:
      return MaterialPageRoute(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider<CustomMapModel>(
              create: (context) => ICustomMapModel(),
            ),
            ChangeNotifierProvider<SetupSalesViewModel>(
                create: (context) => _implSetupSales)
          ],
          child: CustomMapScreen(),
        ),
      );
    case AUTH_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<AuthenticationModel>(
          create: (context) => IAuthenticationModel(),
          child: AuthenticationScreen(),
        ),
      );
    case MAIN_ONBOARDING:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<MainOnboardingModel>(
          create: (context) => IMainOnbooardingModel(),
          child: MainOnboarding(),
        ),
      );
    case SETTINGS_SCREEN:
      return MaterialPageRoute(
        builder: (context) => SettingsScreen(),
      );
    case NOTIFICATION_SCREEN:
      return MaterialPageRoute(
        builder: (context) => NotificationScreen(),
      );
    case ORDERS_SCREEN:
      return MaterialPageRoute(
        builder: (context) => OrdersScreen(),
      );
    case ORDER_DETAILS_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<EndedOrderModel>(
          create: (context) => IEndedOrderModel(),
          child: OrderDetailsScreen(),
        ),
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
