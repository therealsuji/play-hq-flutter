import 'dart:developer';

import 'package:event_bus/event_bus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-secure-storage.dart';
import 'package:play_hq/service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/helpers/networks/app-network.dart';
import 'package:play_hq/models/app-user-model.dart';
import 'package:play_hq/models/loading-event-model.dart';
import 'package:play_hq/services/nav-service.dart';
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
    if (token != null && fcmToken != null) {
      locator<EventBus>().fire(LoadingEvent.show());

      var strapiToken = await _loginToBackend(token, fcmToken);
      SecureStorage.writeValue("jwtToken", strapiToken);
      SecureStorage.writeValue("fcmToken", fcmToken);
      log("strapiToken $strapiToken");
      log("firebaseToken $token");
      log("fcmToken $fcmToken");

      locator<EventBus>().fire(LoadingEvent.hide());
      locator<NavigationService>().pushReplacement(MAIN_SCREEN);
    } else {
      log("token or fcmToken is null");
    }
  }

  _loginToBackend(String token, String fcmToken) async {
    UserModel data = await Network.shared.loginUser(token, fcmToken);
    return data.jwt;
  }

  Future<String?> googleLogin() async {
    // make sure to log out user otherwise it will login using the previous account
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();

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
