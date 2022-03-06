

import 'package:play_hq/models/app_user_model.dart';

abstract class AuthenticationRepository {

  Future<UserModel?> backendLogin(Map<String, dynamic> body);

}