import 'package:get_it/get_it.dart';
import 'package:play_hq/services/nav-service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}