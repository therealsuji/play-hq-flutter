

import 'dart:developer';

import 'package:event_bus/event_bus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_secure_storage.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/app_user_model.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/repository/clients/authentication_repository.dart';
import 'package:play_hq/services/auth_service.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/authentication/authentication_model.dart';

import '../../service_locator.dart';

class IAuthenticationModel extends AuthenticationModel {

  var fcmToken;
  String? token;

  final _logintoBackend = locator<AuthenticationRepository>();

  @override
  void socialLogin(SocialLogin socialLogin) async {
    try {
      switch (socialLogin) {
        case SocialLogin.GOOGLE:
          token = await locator<AuthService>().googleLogin();
          break;
        case SocialLogin.APPLE:
          break;
        case SocialLogin.FACEBOOK:
          token = await locator<AuthService>().facebookLogin();
          break;
        default:
          return null;
      }
    } on FirebaseAuthException catch (e) {
      log("firebase login error -> ${e.message}");
      if (e.code == 'account-exists-with-different-credential') {
        //TODO show dialog to user
      }
      return;
    }
    var fcmToken = await FirebaseMessaging.instance.getToken();
    log("fcmToken $fcmToken");
    log("firebaseToken $token");
    var credentials = {
      "token" : token,
      "fcmToken" : fcmToken,
    };
    if (token != null && fcmToken != null) {
      try {
        await _logintoBackend.backendLogin(credentials).then((value) {
          if (value!.user!.isSetupDone != null && value.user!.isSetupDone == true) {
            SecureStorage.writeValue("jwtToken", value.token!.accessToken);
            SecureStorage.writeValue("fcmToken", fcmToken);
            SecureStorage.writeValue("setupDone", "Done");
            locator<NavigationService>().pushNamed(MAIN_SCREEN);
          } else {
            SecureStorage.writeValue("jwtToken", value.token!.accessToken);
            SecureStorage.writeValue("fcmToken", fcmToken);
            SecureStorage.writeValue("setupDone", "Not Done");
            locator<NavigationService>().pushNamed(MAIN_ONBOARDING);
          }
          locator<EventBus>().fire(LoadingEvent.hide());
        });
      } catch (e) {
        log("login error -> ${e}");
        locator<EventBus>().fire(LoadingEvent.hide());
      }
    }else{
      log("token or fcmToken is null");
    }
  }
}