import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:places_service/places_service.dart';

import 'helpers/networks/app_network.dart';
import 'repository/clients/authentication_repository.dart';
import 'repository/clients/discover_repository.dart';
import 'repository/clients/game_api_repositiry.dart';
import 'repository/clients/game_list_repository.dart';
import 'repository/clients/main_profile_screen_repository.dart';
import 'repository/clients/order_repository.dart';
import 'repository/clients/purchase_repository.dart';
import 'repository/clients/sales_repository.dart';
import 'repository/clients/search_repository.dart';
import 'repository/clients/setup_purchase_repository.dart';
import 'repository/clients/setup_sales_repository.dart';
import 'repository/clients/splash_repository.dart';
import 'repository/clients/user_repository.dart';
import 'repository/delegates/authentication_delegate.dart';
import 'repository/delegates/discover_delegate.dart';
import 'repository/delegates/game_api_delegate.dart';
import 'repository/delegates/game_list_delegate.dart';
import 'repository/delegates/main_profile_screen_delegate.dart';
import 'repository/delegates/orders_delegate.dart';
import 'repository/delegates/purchase_delegate.dart';
import 'repository/delegates/sales_delegate.dart';
import 'repository/delegates/search_delegate.dart';
import 'repository/delegates/setup_purchase_delegate.dart';
import 'repository/delegates/setup_sales_delegate.dart';
import 'repository/delegates/splash_delegate.dart';
import 'repository/delegates/user_delegate.dart';
import 'repository/repositories.dart';
import 'services/auth_service.dart';
import 'services/base_managers/error.dart';
import 'services/dialog_service.dart';
import 'services/error_service.dart';
import 'services/nav_service.dart';

GetIt locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<Network>(
    () => Network.shared,
    dispose: (v) => v.dispose(),
  );
  locator.registerLazySingleton<NavigationService>(
    () => NavigationService(),
  );
  locator.registerLazySingleton<ErrorManager>(
    () => ErrorService(
      locator(),
    ),
  );

  locator.registerLazySingleton(
    () => EventBus(),
  );
  locator.registerLazySingleton<DialogService>(
    () => DialogService(),
  );
  locator.registerLazySingleton<PlacesService>(
    () => PlacesService(),
  );
  locator.registerLazySingleton<AuthService>(
    () => AuthService(),
  );

  locator.registerFactory<HomeRepository>(
    () => HomeDelegate(locator()),
  );
  locator.registerFactory<GameDetailsRepository>(
    () => GameDetailsDelegate(),
  );
  locator.registerFactory<SetupPurchaseRepository>(
    () => SetupPurchaseDelegate(),
  );
  locator.registerFactory<SetupSalesRepository>(
    () => SetupSalesDelegate(),
  );
  locator.registerFactory<AuthenticationRepository>(
    () => AuthenticationDelegate(),
  );
  locator.registerFactory<MainProfileScreenRepository>(
    () => MainProfileScreenDelegate(),
  );
  locator.registerFactory<OrdersRepository>(
    () => OrdersDelegate(),
  );
  locator.registerFactory<SplashRepository>(
    () => SplashDelegate(),
  );
  locator.registerFactory<SaleRepository>(
    () => SaleDelegate(),
  );
  locator.registerFactory<DiscoverRepository>(
    () => DiscoverDelegate(),
  );
  locator.registerFactory<SearchRepository>(
    () => SearchDelegate(),
  );
  locator.registerFactory<GameListRepository>(
    () => GameListDelegate(),
  );
  locator.registerFactory<PurchasesRepository>(
    () => PurchaseDelegate(),
  );
  locator.registerFactory<GameApiRepository>(
    () => GameApiDelegate(),
  );
  locator.registerFactory<UserRepository>(
    () => UserDelegate(),
  );
}
