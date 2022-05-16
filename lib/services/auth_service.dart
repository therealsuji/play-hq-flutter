import 'dart:developer';

import 'package:event_bus/event_bus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_secure_storage.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final _googleSignIn = GoogleSignIn();

  void login(SocialLogin authProvider) async {
    String? token;
    try {
      switch (authProvider) {
        case SocialLogin.GOOGLE:
          token = await googleLogin();
          break;
        case SocialLogin.APPLE:
          // COMPLETE APPLE LOGIN
          break;
        case SocialLogin.FACEBOOK:
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
    final fullName  = loggedInUser.user!.displayName;
    SecureStorage.writeValue("displayName", fullName);
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
