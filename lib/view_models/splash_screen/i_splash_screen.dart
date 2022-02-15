import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_secure_storage.dart';
import 'package:play_hq/repository/clients/splash_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/splash_screen/splash_screen_model.dart';

class ISplashModel extends SplashScreenModel {

  final _splashAPI = locator<SplashRepository>();

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
    // TESTING CODE
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    await _splashAPI.renewJwtToken().then((value) {
      var localToken = value.jwt!;
      if (FirebaseAuth.instance.currentUser != null && localToken != null) {
        SecureStorage.writeValue('jwtToken', value.jwt);
        if(value.user!.setupDone!){
          navigateMainScreen();
        }else{
          navigateOnboarding();
        }
      }
    }).onError((error, stackTrace) {
      SecureStorage.deleteAll();
      navigateSignUpScreen();
    });
  }

  @override
  void navigateOnboarding() {
    locator<NavigationService>().pushReplacement(SETUP_PURCHASE_ACCOUNT_ROUTE , args: SearchType.SETUP_PURCHASES);
  }
}
