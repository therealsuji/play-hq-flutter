import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:places_service/places_service.dart';
import 'package:play_hq/repository/clients/friends_repository.dart';
import 'package:play_hq/repository/clients/skeleton_loading_repository.dart';
import 'package:play_hq/repository/delegates/friends_delegate.dart';
import 'package:play_hq/repository/delegates/skeleton_loading_delegate.dart';
import 'package:play_hq/services/base_managers/response_manager.dart';
import 'package:play_hq/services/response_service.dart';
import 'package:play_hq/view_models/profile/settings/i_settings_view_model.dart';
import 'package:play_hq/view_models/profile/settings/settings_view_model.dart';
import 'package:play_hq/view_models/view_models.dart';

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
import 'services/base_managers/error_manager.dart';
import 'services/dialog_service.dart';
import 'services/error_service.dart';
import 'services/nav_service.dart';

GetIt sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<Network>(
    () => Network.shared,
    dispose: (v) => v.dispose(),
  );
  sl.registerLazySingleton<NavigationService>(
    () => NavigationService(),
  );
  sl.registerLazySingleton<ErrorManager>(
    () => ErrorService(
      sl(),
    ),
  );

  sl.registerLazySingleton(
    () => EventBus(),
  );
  sl.registerLazySingleton<DialogService>(
    () => DialogService(),
  );
  sl.registerLazySingleton<PlacesService>(
    () => PlacesService(),
  );
  sl.registerLazySingleton<AuthService>(
    () => AuthService(),
  );

  sl.registerLazySingleton<ResponseManager>(
    () => ResponseService(
      sl(),
    ),
  );

  sl.registerFactory<SettingsViewModel>(
    () => ISettingsViewModel(
      authService: sl(),
      navigationService: sl(),
      settingsRepository: sl(),
      errorManager: sl(),
    ),
  );

  sl.registerFactory<GameDetailsViewModel>(
    () => IGameDetailsViewModel(
      gameDetailsRepository: sl(),
      navigationService: sl(),
      errorManager: sl(),
    ),
  );

  sl.registerFactory<HomeRepository>(
    () => HomeDelegate(sl()),
  );
  sl.registerFactory<GameDetailsRepository>(
    () => GameDetailsDelegate(),
  );
  sl.registerFactory<SetupPurchaseRepository>(
    () => SetupPurchaseDelegate(),
  );
  sl.registerFactory<SetupSalesRepository>(
    () => SetupSalesDelegate(),
  );
  sl.registerFactory<AuthenticationRepository>(
    () => AuthenticationDelegate(),
  );
  sl.registerFactory<MainProfileScreenRepository>(
    () => MainProfileScreenDelegate(),
  );
  sl.registerFactory<OrdersRepository>(
    () => OrdersDelegate(),
  );
  sl.registerFactory<SplashRepository>(
    () => SplashDelegate(),
  );
  sl.registerFactory<SaleRepository>(
    () => SaleDelegate(),
  );
  sl.registerFactory<DiscoverRepository>(
    () => DiscoverDelegate(),
  );
  sl.registerFactory<SearchRepository>(
    () => SearchDelegate(),
  );
  sl.registerFactory<GameListRepository>(
    () => GameListDelegate(),
  );
  sl.registerFactory<PurchasesRepository>(
    () => PurchaseDelegate(),
  );
  sl.registerFactory<GameApiRepository>(
    () => GameApiDelegate(),
  );
  sl.registerFactory<UserRepository>(
    () => UserDelegate(),
  );

  sl.registerFactory<SkeletonLoadingRepository>(()
    => SkeletonLoadingDelegate()
  );

  sl.registerFactory<SettingsRepository>(
    () => SettingsDelegate(
      sl(),
    ),
  );
  sl.registerFactory<FriendsRepository>(
    () => FriendsDelegate(),
  );
}
