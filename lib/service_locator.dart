import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:places_service/places_service.dart';
import 'package:play_hq/repository/clients/authentication_repository.dart';
import 'package:play_hq/repository/clients/order_repository.dart';
import 'package:play_hq/repository/clients/setup_purchase_repository.dart';
import 'package:play_hq/repository/clients/setup_sales_repository.dart';
import 'package:play_hq/repository/delegates/authentication_delegate.dart';
import 'package:play_hq/repository/delegates/orders_delegate.dart';
import 'package:play_hq/repository/delegates/setup_purchase_delegate.dart';
import 'package:play_hq/repository/delegates/setup_sales_delegate.dart';
import 'package:play_hq/repository/repositories.dart';
import 'package:play_hq/services/auth_service.dart';
import 'package:play_hq/services/base_managers/error.dart';
import 'package:play_hq/services/error_service.dart';
import 'package:play_hq/services/nav_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<ErrorManager>(() => ErrorService());
  locator.registerLazySingleton(() => EventBus());
  locator.registerLazySingleton<PlacesService>(() => PlacesService());
  locator.registerLazySingleton<AuthService>(() => AuthService());

  locator.registerFactory<HomeRepository>(() => HomeDelegate());
  locator.registerFactory<GameDetailsRepository>(() => GameDetailsDelegate());
  locator.registerFactory<SetupPurchaseRepository>(() => SetupPurchaseDelegate());
  locator.registerFactory<SetupSalesRepository>(() => SetupSalesDelegate());
  locator.registerFactory<AuthenticationRepository>(() => AuthenticationDelegate());
  locator.registerFactory<OrdersRepository>(() => OrdersDelegate());
}
