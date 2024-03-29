import 'package:play_hq/helpers/app_secure_storage.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/auth_service.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/profile/settings/settings_view_model.dart';

class ISettingsViewModel extends SettingsViewModel {
  @override
  void logoutUser() {
    locator<AuthService>().logOut();
    locator<NavigationService>().pushAndRemoveUntil(AUTH_SCREEN);
  }
}
