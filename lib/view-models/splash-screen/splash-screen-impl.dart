

import 'dart:async';

import 'package:play_hq/helpers/app-service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/services/nav-service.dart';
import 'package:play_hq/view-models/splash-screen/splash-screen-model.dart';

class ImplSplash extends SplashScreenModel{


  @override
  void changeScreen() {
    Timer(
        Duration(seconds: 3), () => locator<NavigationService>().pushReplacement(SIGN_UP_SCREEN)
    );
    notifyListeners();
  }



}