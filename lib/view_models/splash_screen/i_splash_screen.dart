import 'package:firebase_messaging/firebase_messaging.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/app_strings.dart';
import '../../injection_container.dart';
import '../../services/auth_service.dart';
import '../../services/nav_service.dart';
import 'splash_screen_model.dart';

class ISplashModel extends SplashScreenModel {
  @override
  void navigateMainScreen() {
    sl<NavigationService>().pushReplacement(MAIN_SCREEN);
  }

  @override
  void navigateSignUpScreen() {
    sl<NavigationService>().pushReplacement(AUTH_SCREEN);
  }

  @override
  void navigateOnBoarding() {
    sl<NavigationService>()
        .pushReplacement(SETUP_PURCHASE_ACCOUNT_ROUTE , args: true);
  }

  @override
  void startAuthentication() async {
    // TESTING CODE
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    var isSetupDone = await sl<AuthService>().renewTokens();
    if (isSetupDone == true) {
      navigateMainScreen();
    } else if (isSetupDone == false) {
      navigateOnBoarding();
    } else {
      navigateSignUpScreen();
    }
  }
}
