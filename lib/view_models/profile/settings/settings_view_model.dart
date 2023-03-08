import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:play_hq/models/common_models/location_model.dart';

abstract class SettingsViewModel with ChangeNotifier {
  Future<bool> updateUserDetails({
    required String name,
    required String displayName,
    required String phoneNumber,
    required LocationModel location
  });

  void changeAddress({
    required LocationModel locationModel
  });

  void logoutUser();
}
