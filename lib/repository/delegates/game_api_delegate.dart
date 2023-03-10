import 'dart:async';

import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/helpers/networks/app_network_helper.dart';
import 'package:play_hq/models/rawg_models/rawg_game_details.dart';
import 'package:play_hq/repository/clients/game_api_repositiry.dart';

class GameApiDelegate extends GameApiRepository with NetworkHelper {
  @override
  Future<RawgGameDetails> getPopularGames() {
    return this.fetchAll<RawgGameDetails>(APIConfig.popularThisYear(), rawgGameDetailsFromJson).then((value) => value.result);
  }

  @override
  Future<RawgGameDetails> getUpComingGames() {
    return this.fetchAll<RawgGameDetails>(APIConfig.getUpcomingGames(5), rawgGameDetailsFromJson).then((value) => value.result);
  }

  @override
  Future<RawgGameDetails> getRecommendedGamesFromGenres(List<int> genres) {
    return this.fetchAll<RawgGameDetails>(APIConfig.getRecommendGamesFromGenres(genres), rawgGameDetailsFromJson).then((value) => value.result);
  }
}


