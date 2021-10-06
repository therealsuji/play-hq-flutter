import 'package:play_hq/models/game_details_models/get_game_details.dart';

abstract class GameDetailsRepository {

  Future<GetGameDetails?> getGameDetails(int id);

  Future<void> setGameWishList(Map<String, dynamic> body);

  Future<void> setGameLibrary(Map<String, dynamic> body);
}