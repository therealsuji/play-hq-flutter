

import 'package:play_hq/models/game_details_models/game_details_model.dart';
import 'package:play_hq/models/rawg_models/rawg_game_details.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';

abstract class DiscoverRepository{

  Future<RawgGameDetails> fetchNewlyReleasedGames();

}