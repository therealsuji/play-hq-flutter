import 'package:play_hq/helpers/app_enums.dart';

class GameListArguments {
  final String? screenTitle;
  final GameLists? apiType;
  final Map<String, String>? args;

  GameListArguments({
    this.apiType,
    this.screenTitle,
    this.args,
  });
}
