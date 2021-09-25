import 'dart:developer';

import 'package:event_bus/event_bus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_secure_storage.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/models/app_user_model.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final _googleSignIn = GoogleSignIn();

  void login(LOGIN_PROVIDER authProvider) async {
    String? token;
    try {
      switch (authProvider) {
        case LOGIN_PROVIDER.GOOGLE:
          token = await googleLogin();
          break;
        case LOGIN_PROVIDER.APPLE:
          // COMPLETE APPLE LOGIN
          break;
        case LOGIN_PROVIDER.FACEBOOK:
          token = await facebookLogin();
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
    if (token != null && fcmToken != null) {
      UserModel userData = await _loginToBackend(token, fcmToken);
      if(userData.user!.setupDone == true){
        SecureStorage.writeValue("jwtToken", userData.jwt);
        SecureStorage.writeValue("fcmToken", fcmToken);
        locator<EventBus>().fire(LoadingEvent.hide());
        locator<NavigationService>().pushNamed(MAIN_SCREEN);
      }else{
        SecureStorage.writeValue("jwtToken", userData.jwt);
        SecureStorage.writeValue("fcmToken", fcmToken);
        locator<EventBus>().fire(LoadingEvent.hide());
        locator<NavigationService>().pushNamed(MAIN_ONBOARDING);
      }
    } else {
      log("token or fcmToken is null");
    }
  }

  _loginToBackend(String token, String fcmToken) async {
    UserModel data = await Network.shared.loginUser(token, fcmToken);
    return data;
  }

  Future<String?> googleLogin() async {

    // make sure to log out user otherwise it will login using the previous account
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();

    locator<EventBus>().fire(LoadingEvent.show());

    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final loggedInUser = await FirebaseAuth.instance.signInWithCredential(credential);
    final token = await loggedInUser.user!.getIdToken();
    return token;
  }

  Future<String?> facebookLogin() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    final loggedInUser = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    final token = await loggedInUser.user!.getIdToken();
    return token;
  }

  void logOut() async {
    SecureStorage.deleteKey("jwtToken");
    SecureStorage.deleteKey("fcmToken");
    // add other providers
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
    locator<NavigationService>().pushReplacement(SIGN_UP_SCREEN);
  }
}
