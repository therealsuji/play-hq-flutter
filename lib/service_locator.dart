import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:places_service/places_service.dart';
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

  locator.registerFactory<GameDetailsRepository>(() => GameDetailsDelegate());
}