import 'package:flutter/cupertino.dart';

abstract class SplashScreenModel with ChangeNotifier {
  void navigateSignUpScreen();

  void navigateMainScreen();

  void startAuthentication();
}
