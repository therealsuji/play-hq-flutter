import 'package:play_hq/models/app_user_model.dart';

import '../../models/common_models/game_preferences/response_body.dart';

abstract class AuthenticationRepository {
  Future<AuthUserModel?> backendLogin(Map<String, dynamic> body);

  Future<AuthUserModel?> renewTokens(dynamic body);

}
