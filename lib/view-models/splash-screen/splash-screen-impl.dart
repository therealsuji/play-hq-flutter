import 'package:firebase_auth/firebase_auth.dart';
import 'package:play_hq/helpers/app_secure_storage.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/view_models.dart';

import '../../service_locator.dart';

class ImplSplash extends SplashScreenModel {
  @override
  void navigateMainScreen() {
    locator<NavigationService>().pushReplacement(MAIN_SCREEN);
  }

  @override
  void navigateSignUpScreen() {
    locator<NavigationService>().pushReplacement(AUTH_SCREEN);
  }

  @override
  void startAuthentication() async {
    var localToken = await SecureStorage.readValue('jwtToken');
    if (FirebaseAuth.instance.currentUser != null && localToken != null) {
      navigateMainScreen();
    } else {
      navigateSignUpScreen();
    }
  }
}
