

import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/view_models/profile/main_profile/main_profile_model.dart';

class IMainProfileModel extends MainProfileModel {

  List<GameDetails> _selectedGames = [];

  @override
  void addSelectedGame(GameDetails game) {

  }

  @override
  // TODO: implement selectedGameList
  List<GameDetails> get selectedGameList => throw UnimplementedError();


}