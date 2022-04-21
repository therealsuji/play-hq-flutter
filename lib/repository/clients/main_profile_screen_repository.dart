
import 'package:play_hq/models/common_models/game_preferance_models.dart';

abstract class MainProfileScreenRepository {

  Future<List<FakePreferances>> getWishListGames();

  Future<List<FakePreferances>> getLibraryGames();

}