import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/models/common_models/user/user_details.dart';
import 'package:play_hq/repository/clients/settings_repository.dart';

class SettingsDelegate implements SettingsRepository {
  final Network networkCalls;

  const SettingsDelegate(this.networkCalls);

  @override
  Future<UserDetails> updateUserDetails(Map<String, String> body) async {
    var response = await networkCalls.performRequest(
      APIConfig.updateUserDetails,
      HttpAction.PUT,
      body: body,
    );

    return await compute(userDetailsfromJson, response.body);
  }
}
