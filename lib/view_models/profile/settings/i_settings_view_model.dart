

import 'package:play_hq/helpers/app_secure_storage.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/profile/settings/settings_view_model.dart';

class ISettingsViewModel extends SettingsViewModel {

  @override
  void logoutUser() {
    SecureStorage.deleteAll();
    locator<NavigationService>().pushNamed(AUTH_SCREEN);
  }

}