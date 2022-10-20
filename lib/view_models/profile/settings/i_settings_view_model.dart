import 'package:play_hq/repository/repositories.dart';

import '../../../helpers/app_strings.dart';
import '../../../injection_container.dart';
import '../../../services/auth_service.dart';
import '../../../services/nav_service.dart';
import 'settings_view_model.dart';

class ISettingsViewModel extends SettingsViewModel {
  final SettingsRepository settingsRepository;
  final AuthService authService;
  final NavigationService navigationService;

  ISettingsViewModel({
    required this.settingsRepository,
    required this.authService,
    required this.navigationService,
  });

  @override
  void logoutUser() {
    authService.logOut();
    navigationService.pushAndRemoveUntil(AUTH_SCREEN);
  }
}
