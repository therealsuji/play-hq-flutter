import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/screens/custom_search_screen/friends_search_screen.dart';
import 'package:play_hq/screens/nav_bar_screens/profile_screen/profile_screen.dart';
import 'package:play_hq/view_models/custom_search/friends_search_model.dart';
import 'package:provider/provider.dart';

import '../injection_container.dart';
import '../models/common_models/game_list_arguments_model.dart';
import '../models/common_models/user/user_details.dart';
import '../models/game_details_models/game_details_arguments.dart';
import '../models/sales/sales_payload_model.dart';
import '../screens/game_lists/game_list_screen.dart';
import '../screens/my-sales/my_sales_details_screen/my_sales_details_screen.dart';
import '../screens/nav_bar_screens/profile_screen/notification_screen/notification_screen.dart';
import '../screens/nav_bar_screens/profile_screen/settings_screen/settings_screen.dart';
import '../screens/screens.dart';
import '../screens/sign_up_screens/auth_flow_screens/authentication_screen.dart';
import '../screens/sign_up_screens/onboarding/app_onboarding/main_onboarding.dart';
import '../view_models/authentication/authentication_model.dart';
import '../view_models/authentication/i_authentication_model.dart';
import '../view_models/discover/discover_view_model.dart';
import '../view_models/discover/i_discover_view_model.dart';
import '../view_models/game_lists/game_list_view_model.dart';
import '../view_models/game_lists/i_game_list_view_model.dart';
import '../view_models/main_onboarding/i_main_onboarding_model.dart';
import '../view_models/main_onboarding/main_onboarding_model.dart';
import '../view_models/orders/order_requests/i_order_request_view_model.dart';
import '../view_models/orders/order_requests/order_request_view_model.dart';
import '../view_models/profile/main_profile/i_main_profile_model.dart';
import '../view_models/profile/main_profile/main_profile_model.dart';
import '../view_models/profile/settings/settings_view_model.dart';
import '../view_models/sales/create_sale/create_sale_model.dart';
import '../view_models/sales/sales_details/i_sales_details_view_model.dart';
import '../view_models/sales/sales_details/sales_details_view_model.dart';
import '../view_models/view_models.dart';
import 'app_enums.dart';
import 'app_strings.dart';

ISetupPurchaseAccountModel _implSetupPurchaseAccount = ISetupPurchaseAccountModel();
ISetupSalesModel _implSetupSales = ISetupSalesModel();

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
            ChangeNotifierProvider<DiscoverViewModel>(
              create: (context) => IDiscoverViewModel(),
            ),
          ],
          child: MainScreen(),
        ),
      );
    case SALES_ACCOUNT_SCREEN:
      return MaterialPageRoute(
          builder: (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider<SetupSalesViewModel>(
                    create: (context) => _implSetupSales,
                  ),
                  ChangeNotifierProvider<CreateSaleModel>(
                    create: (context) => ICreateSaleModel(),
                  ),
                ],
                child: SetupSalesAccountScreen(),
              ));
    case FRIENDS_SEARCH:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<FriendsSearchModel>(
          create: (context) => FriendsSearchModel(),
          child: FriendsSearchScreen(),
        ),
      );
    case GAME_DETAILS_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => sl<GameDetailsViewModel>(),
          child: GameDetailsScreen(
            gameDetailsArguments: settings.arguments as GameDetailsArguments,
          ),
        ),
      );
    case PURCHASE_ACCOUNT_SCREEN:
      return MaterialPageRoute(
          builder: (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider<SetupPurchaseAccountModel>(
                    create: (context) => ISetupPurchaseAccountModel(),
                  ),
                  ChangeNotifierProvider<CreateSaleModel>(
                    create: (context) => ICreateSaleModel(),
                  ),
                ],
                child: SetupPurchaseAccountScreen(
                  isOnboarding: settings.arguments as bool,
                ),
              ));
    case SPLASH_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<SplashScreenModel>(
          create: (context) => ISplashModel(),
          child: SplashScreen(),
        ),
      );
    case MAIN_SEARCH_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<CustomSearchModel>(
          create: (context) => ICustomSearchModel(),
          child: MainSearchScreen(values: settings.arguments as SearchType),
        ),
      );
    case CUSTOM_ADDRESS_SEARCH_SCREEN:
      return MaterialPageRoute(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider<CustomAddressSearchModel>(
              create: (context) => ICustomAddressSearchModel(),
            ),
          ],
          child: CustomAddressSearchScreen(),
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
        builder: (context) => ChangeNotifierProvider(
          create: (context) => sl<SettingsViewModel>(),
          child: SettingsScreen(
            userDetails: settings.arguments as UserDetails,
          ),
        ),
      );
    case GAME_SALE_DETAILS_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<SalesDetailsViewModel>(
            create: (context) => ISalesDetailsViewModel(),
            child: GameSaleDetailsScreen(
              gameSalePayload: settings.arguments as SalesPayload,
            )),
      );
    case MY_SALES_DETAILS_SCREEN:
      return MaterialPageRoute(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider<SalesDetailsViewModel>(create: (context) => ISalesDetailsViewModel()),
            ChangeNotifierProvider<OrderRequestViewModel>(create: (context) => IOrderRequestsViewModel())
          ],
          child: MySalesDetailsScreen(
            salesPayload: settings.arguments as SalesPayload,
          ),
        ),
      );
    case NOTIFICATION_SCREEN:
      return MaterialPageRoute(
        builder: (context) => NotificationScreen(),
      );
    case GAME_LIST_SCREEN:
      return MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<GameListViewModel>(
            create: (context) => IGameListViewModel(),
            child: GameListScreen(
              gameListArguments: settings.arguments as GameListArguments,
            )),
      );
    case CUSTOM_MAP_SCREEN:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<CustomMapModel>(
                create: (context) => ICustomMapModel(),
                child: CustomMapScreen(),
              ));
    case USER_PROFILE_SCREEN:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<MainProfileModel>(
                create: (context) => IMainProfileModel(),
                child: Scaffold(
                  backgroundColor: BACKGROUND_COLOR,
                  body: ProfileScreen(userEmail: settings.arguments as String),
                ),
              ));
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
