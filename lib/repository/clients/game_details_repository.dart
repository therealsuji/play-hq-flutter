import 'package:play_hq/models/game_details_models/get_game_details.dart';
import 'package:play_hq/models/game_status.dart';

abstract class GameDetailsRepository {

  Future<GetGameDetails?> getGameDetails(int id);

  Future<void> setGameWishList(Map<String, dynamic> body);

  Future<void> setGameLibrary(Map<String, dynamic> body);

  Future<void> deleteWishListGame(int id);

  Future<void> deleteLibraryGame(int id);

  Future<GameStatus> getGameStatus(int id);
}