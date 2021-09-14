import 'package:play_hq/models/game_details_models/get_game_details.dart';

abstract class GameDetailsRepository {

  Future<GetGameDetails?> getGameDetails(int id);
}