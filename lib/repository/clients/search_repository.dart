import 'package:play_hq/models/rawg_models/rawg_game_details.dart';

abstract class SearchRepository {

  Future<RawgGameDetails> fetchNewlyReleasedGames();
}