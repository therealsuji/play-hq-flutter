

import 'package:play_hq/models/app_user_model.dart';

abstract class SplashRepository {

  Future<AuthUserModel> renewJwtToken(dynamic body);

}