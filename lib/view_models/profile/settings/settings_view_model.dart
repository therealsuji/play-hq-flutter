import 'package:flutter/foundation.dart' show ChangeNotifier;

abstract class SettingsViewModel with ChangeNotifier {
  void updateUserDetails({
    required String name,
    required String displayName,
    required String phoneNumber,
  });

  void logoutUser();
}
