import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-secure-storage.dart';
import 'package:play_hq/helpers/app-service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/helpers/networks/app-network.dart';
import 'package:play_hq/models/app-user-model.dart';
import 'package:play_hq/services/auth_providers/google_auth_service.dart';
import 'package:play_hq/services/nav-service.dart';

class AuthService {
  void login(LOGIN_PROVIDER authProvider) async {
    String token;
    switch (authProvider) {
      case LOGIN_PROVIDER.GOOGLE:
        token = await locator<GoogleAuthService>().login();
        break;
      case LOGIN_PROVIDER.APPLE:
        // COMPLETE APPLE LOGIN
        break;
      case LOGIN_PROVIDER.FACEBOOK:
        // COMPLETE FACEBOOK LOGIN
        break;
      default:
        return null;
    }
    if (token != null) {
      log(token);
      var strapi_token = await _getUserToken(token);
      SecureStorage.writeValue("jwtToken", token);
      locator<NavigationService>().pushReplacement(MAIN_SCREEN);
    }
  }

  _getUserToken(String token) async {
    UserModel data = await Network.shared.loginUser(token);
    return data.jwt;
  }

  void logOut() async {
    // add other providers
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    locator<NavigationService>().pushReplacement(SIGN_UP_SCREEN);
  }
}
