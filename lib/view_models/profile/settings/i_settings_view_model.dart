import 'dart:convert';

import '../../../helpers/app_secure_storage.dart';
import '../../../helpers/app_strings.dart';
import '../../../models/common_models/user/user_details.dart';
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
  }) async {
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

    var response = await settingsRepository.updateUserDetails(body);

    _getUserDetails(response);
  }

  @override
  void logoutUser() {
    authService.logOut();
    navigationService.pushAndRemoveUntil(AUTH_SCREEN);
  }

  void _getUserDetails(UserDetails userDetails) {
    SecureStorage.writeValue('userDetailsKey', json.encode(userDetails.toJson()));
  }
}
