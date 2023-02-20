import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:play_hq/models/common_models/game_preferences/response_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/app_enums.dart';
import '../helpers/app_secure_storage.dart';
import '../models/common_models/auth_token_model.dart';
import '../models/common_models/user/user_details.dart';
import '../models/common_models/user/user_game_preferences.dart';
import '../repository/clients/authentication_repository.dart';
import '../repository/clients/main_profile_screen_repository.dart';
import '../repository/clients/user_repository.dart';
import '../injection_container.dart';

class AuthService {
  final _googleSignIn = GoogleSignIn();
  final _authRepository = sl<AuthenticationRepository>();
  final _userRepositry = sl<UserRepository>();
  static const USER_DETAILS_KEY = "userDetailsKey";
  static const USER_PREFERENCES_KEY = "userPreferencesKey";
  static const WISHLIST_GAMES_KEY = 'userWishlistGames';
  static const JWT_KEY = "jwtKey";
  static const REFRESH_KEY = "refreshKey";
  static const FCM_KEY = "fcmKey";



  Future<bool?> socialLogin(SocialLogin authProvider) async {
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
      var fcmToken = await FirebaseMessaging.instance.getToken();
      if (token?.isNotEmpty == true && fcmToken != null) {
        var credentials = {
          "token": token,
          "fcmToken": fcmToken,
        };
        var response = await _authRepository.backendLogin(credentials);
        if (response == null) {
          return null;
        }
        var isSetupDone = response.user?.isSetupDone ?? false;
        if (response.token != null && response.user != null) {
          SecureStorage.writeValue("setupDone", isSetupDone ? "Done" : "Not Done");
          SecureStorage.writeValue(FCM_KEY, fcmToken);
          log(response.token?.accessToken ?? "");
          saveTokens(response.token!);
          saveUserData(response.user!);
          var userGamePreferences = await _userRepositry.getUserGamePreferences();
          GamePreferancesResponse userWishlistGames = await _userRepositry.getWishlistGames();
          saveUserGamePreference(userGamePreferences);
          saveWishlistGames(userWishlistGames.data);
        }
        return isSetupDone;
      } else {
        log("token or fcmToken is null");
      }
    } on FirebaseAuthException catch (e) {
      log("firebase login error -> ${e.message}");
      if (e.code == 'account-exists-with-different-credential') {
        //TODO show dialog to user
      }
    } catch (e) {
      log("login error -> $e");
    }
    return null;
  }

  void saveTokens(AuthTokenModel tokens) async {
    SecureStorage.writeValue(JWT_KEY, tokens.accessToken);
    SecureStorage.writeValue(REFRESH_KEY, tokens.refreshToken);
  }

  void saveUserData(UserDetails details) {
    SecureStorage.writeValue(USER_DETAILS_KEY, json.encode(details.toJson()));
  }

  void saveUserGamePreference(UserGamePreferences details) {
    SecureStorage.writeValue(USER_PREFERENCES_KEY, json.encode(details.toJson()));
  }

  void saveWishlistGames(List<Data> games) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(WISHLIST_GAMES_KEY, GamePreferancesResponse.encode(games));
  }

  Future<List<Data>> getWishlistGames() async {
    final prefs = await SharedPreferences.getInstance();
    var jsonData = prefs.getString(WISHLIST_GAMES_KEY);
    return GamePreferancesResponse.decode(jsonData!);
  }

  Future<UserDetails> getUserDetails() async {
    var jsonData = await SecureStorage.readValue(USER_DETAILS_KEY);
    return UserDetails.fromJson(json.decode(jsonData!));
  }

  Future<UserGamePreferences> getUserGamePreferences() async {
    var jsonData = await SecureStorage.readValue(USER_PREFERENCES_KEY);
    return UserGamePreferences.fromJson(json.decode(jsonData!));
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
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    final loggedInUser = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    final token = await loggedInUser.user!.getIdToken();
    return token;
  }

  void logOut() async {
    await SecureStorage.deleteAll();
    // add other providers
    await GoogleSignIn().signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
  }

  Future<bool?> renewTokens() async {
    String accessToken = await SecureStorage.readValue(JWT_KEY) ?? '';
    String refreshToken = await SecureStorage.readValue(REFRESH_KEY) ?? '';

    AuthTokenModel authTokens =
        AuthTokenModel(refreshToken: refreshToken, accessToken: accessToken);
    try {
      var response = await _authRepository.renewTokens(authTokens);
      var localToken = response?.token!.accessToken;
      if (FirebaseAuth.instance.currentUser != null && localToken != null) {
        if (response != null && response.token != null && response.user != null) {
          saveTokens(response.token!);
        }
        return response?.user?.isSetupDone;
      }
    } catch (e) {
      SecureStorage.deleteAll();
    }
    return null;
  }
}
