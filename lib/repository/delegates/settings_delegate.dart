import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/repository/clients/settings_repository.dart';

class SettingsDelegate implements SettingsRepository {
  final Network networkCalls;

  const SettingsDelegate(this.networkCalls);

  @override
  void updateUserDetails(Map<String, String> body) async {
    await networkCalls.performRequest(
      APIConfig.updateUserDetails,
      HttpAction.PUT,
      body: body,
    );
  }
}
