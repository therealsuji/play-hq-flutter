import 'package:play_hq/models/common_models/user/user_details.dart';

abstract class SettingsRepository {
  Future<UserDetails> updateUserDetails(Map<String, String> body);
}
