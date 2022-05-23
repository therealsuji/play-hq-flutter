import 'package:play_hq/models/rawg_models/rawg_game_details.dart';

abstract class GameListRepository {

  Future<RawgGameDetails> fetchTopRatedGames();

  Future<RawgGameDetails> fetchUpcomingGames();

  Future<RawgGameDetails> fetchGamesOf2022();
}