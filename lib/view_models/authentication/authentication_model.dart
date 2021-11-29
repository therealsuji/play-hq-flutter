
import 'package:flutter/cupertino.dart';
import 'package:play_hq/helpers/app_enums.dart';

abstract class AuthenticationModel with ChangeNotifier {

  void socialLogin(SocialLogin socialLogin);

}