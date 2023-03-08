import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:play_hq/models/common_models/location_model.dart';

import '../../../helpers/app_secure_storage.dart';
import '../../../helpers/app_strings.dart';
import '../../../injection_container.dart';
import '../../../models/common_models/user/user_details.dart';
import '../../../models/errors/exceptions.dart';
import '../../../repository/clients/user_repository.dart';
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

  final _userApi = sl<UserRepository>();

  ISettingsViewModel({
    required this.settingsRepository,
    required this.authService,
    required this.navigationService,
    required this.errorManager,
  });

  @override
  Future<bool> updateUserDetails({
    required LocationModel location,
    required String name,
    required String displayName,
    required String phoneNumber,
  }) async {
    var body = {
      'name': name,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'location': location
    };

    Response response = await _userApi.updateUserDetails(body);

    if (response.statusCode == 200){
      UserDetails user = UserDetails.fromJson(jsonDecode(response.body));
      _getUserDetails(user);
      return true;
    }else{
      debugPrint('Could not update');
      return false;
    }

  }

  @override
  void logoutUser() {
    authService.logOut();
    navigationService.pushAndRemoveUntil(AUTH_SCREEN);
  }

  void _getUserDetails(UserDetails userDetails) {
    SecureStorage.writeValue('userDetailsKey', json.encode(userDetails.toJson()));
  }

  @override
  void changeAddress({required LocationModel locationModel}) async{
    var body = {
      'location': locationModel
    };
    var response = await _userApi.updateUserDetails(body);
  }
}
