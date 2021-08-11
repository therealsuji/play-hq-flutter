import 'package:firebase_auth/firebase_auth.dart';
import 'package:play_hq/helpers/app-secure-storage.dart';
import 'package:play_hq/helpers/app-service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/services/nav-service.dart';
import 'package:play_hq/view-models/splash-screen/splash-screen-model.dart';

class ImplSplash extends SplashScreenModel {
  @override
  void navigateMainScreen() {
    locator<NavigationService>().pushReplacement(HOME_SCREEN);
  }

  @override
  void navigateSignUpScreen() {
    locator<NavigationService>().pushReplacement(SIGN_UP_SCREEN);
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
