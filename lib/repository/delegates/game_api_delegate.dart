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
  Future<RawgGameDetails> getUpComingGames() async{
    RawgResult rawgResult = await this.rawgPostCalls(await APIConfig.getUpcomingGames(2));
    final random2 = Random();
    final randomSize = random2.nextInt(rawgResult.gamesCount) + 1;
    return this.fetchAll<RawgGameDetails>(await APIConfig.getUpcomingGames(randomSize), rawgGameDetailsFromJson).then((value) => value.result);
  }

  @override
  Future<RawgGameDetails> getRecommendedGamesFromGenres() async{
    int pages = 0;
    RawgResult rawgResult = await this.rawgPostCalls(await APIConfig.getRecommendGamesFromGenres(5));
    DateTime currentDate = DateTime.now();
    final random = Random(currentDate.millisecondsSinceEpoch ~/ 259200000);
    if(rawgResult.gamesCount < 10){
      pages = random.nextInt(rawgResult.gamesCount) + 1;
    }else{
      pages = random.nextInt(10) + 1;
    }
    return this.fetchAll<RawgGameDetails>(await APIConfig.getRecommendGamesFromGenres(pages), rawgGameDetailsFromJson , cacheData: true).then((value) => value.result);
  }
}


