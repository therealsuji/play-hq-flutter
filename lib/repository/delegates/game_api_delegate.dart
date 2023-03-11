import 'dart:async';
import 'dart:math';

import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/helpers/networks/app_network_helper.dart';
import 'package:play_hq/models/rawg_models/rawg_game_details.dart';
import 'package:play_hq/repository/clients/game_api_repositiry.dart';

class GameApiDelegate extends GameApiRepository with NetworkHelper {
  @override
  Future<RawgGameDetails> getPopularGames() {
    return this
        .fetchAll<RawgGameDetails>(APIConfig.popularThisYear(), rawgGameDetailsFromJson, cacheData: true)
        .then((value) => value.result);
  }

  @override
  Future<RawgGameDetails> getUpComingGames() async {
    final random2 = Random();
    final randomSize = random2.nextInt(5) + 1;
    return this
        .fetchAll<RawgGameDetails>(await APIConfig.getUpcomingGames(randomSize), rawgGameDetailsFromJson,
            cacheData: false)
        .then((value) => value.result);
  }

  @override
  Future<RawgGameDetails> getRecommendedGamesFromGenres(List<int> genres) async {
    return this
        .fetchAll<RawgGameDetails>(await APIConfig.getRecommendGamesFromGenres(), rawgGameDetailsFromJson,
            cacheData: true)
        .then((value) => value.result);
  }
}
