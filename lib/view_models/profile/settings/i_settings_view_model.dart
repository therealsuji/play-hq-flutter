import '../../../helpers/app_strings.dart';
import '../../../models/errors/exceptions.dart';
import '../../../repository/repositories.dart';
import '../../../services/auth_service.dart';
import '../../../services/base_managers/error_manager.dart';
import '../../../services/nav_service.dart';
import 'settings_view_model.dart';

class ISettingsViewModel extends SettingsViewModel {
  final SettingsRepository settingsRepository;
  final AuthService authService;
  final NavigationService navigationService;
  final ErrorManager errorManager;

  ISettingsViewModel({
    required this.settingsRepository,
    required this.authService,
    required this.navigationService,
    required this.errorManager,
  });

  @override
  void updateUserDetails({
    required String name,
    required String displayName,
    required String phoneNumber,
  }) {
    if (name == "" || displayName == "" || phoneNumber == "") {
      return errorManager.showError(
        UnknownFailure(message: "User details can't be empty!"),
      );
    }

    var body = {
      'name': name,
      'displayName': displayName,
      'phone': phoneNumber,
    };

    settingsRepository.updateUserDetails(body);
  }

  @override
  void logoutUser() {
    authService.logOut();
    navigationService.pushAndRemoveUntil(AUTH_SCREEN);
  }
}
