import 'package:get_it/get_it.dart';
import 'package:play_hq/services/auth_providers/google_auth_service.dart';
import 'package:play_hq/services/auth_service.dart';
import 'package:play_hq/services/nav-service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<GoogleAuthService>(() => GoogleAuthService());
  locator.registerLazySingleton<AuthService>(() => AuthService());
}