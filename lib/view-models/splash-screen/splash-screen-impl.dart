import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:play_hq/helpers/app-secure-storage.dart';
import 'package:play_hq/service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/services/nav-service.dart';
import 'package:play_hq/view-models/splash-screen/splash-screen-model.dart';

class ImplSplash extends SplashScreenModel {
  @override
  void navigateMainScreen() {
    locator<NavigationService>().pushReplacement(MAIN_SCREEN);
  }

  @override
  void navigateSignUpScreen() {
    locator<NavigationService>().pushReplacement(SIGN_UP_SCREEN);
  }

  @override
  void startAuthentication() async {
    var localToken = await SecureStorage.readValue('jwtToken');
    var fcmToken = await SecureStorage.readValue('fcmToken');
    log("strapiToken $localToken");
    log("fcmToken $fcmToken");
    log("firebaseToken ${await FirebaseAuth.instance.currentUser?.getIdToken()}");
    // TESTING CODE
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    if (FirebaseAuth.instance.currentUser != null && localToken != null) {
      navigateMainScreen();
    } else {
      navigateSignUpScreen();
    }
  }
}
