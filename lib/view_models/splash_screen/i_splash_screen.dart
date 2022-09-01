import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/services/auth_service.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/splash_screen/splash_screen_model.dart';

class ISplashModel extends SplashScreenModel {
  @override
  void navigateMainScreen() {
    locator<NavigationService>().pushReplacement(MAIN_SCREEN);
  }

  @override
  void navigateSignUpScreen() {
    locator<NavigationService>().pushReplacement(AUTH_SCREEN);
  }

  @override
  void navigateOnBoarding() {
    locator<NavigationService>()
        .pushReplacement(SETUP_PURCHASE_ACCOUNT_ROUTE, args: SearchType.SETUP_PURCHASES);
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

    var isSetupDone = await locator<AuthService>().renewTokens();
    if (isSetupDone == true) {
      navigateMainScreen();
    } else if (isSetupDone == false) {
      navigateOnBoarding();
    } else {
      navigateSignUpScreen();
    }
  }
}
