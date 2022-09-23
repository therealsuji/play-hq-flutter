import 'package:play_hq/models/rawg_models/rawg_game_details.dart';

abstract class GameApiRepository {
  Future<RawgGameDetails> getPopularGames();

//https://api.rawg.io/api/games?dates=2022-09-01,2023-12-31&ordering=-rating&key=be9f8d00d9d04aa6b1b3f6ee26f305b4
  Future<RawgGameDetails> getUpComingGames();
}
