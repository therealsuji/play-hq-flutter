


import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/common_models/game_preference_model.dart';

abstract class MainProfileModel with ChangeNotifier {

  List<GamePreferences> get fetchAllWishlistGames;

  void getMyGames();

  List<GamePreferences> get fetchAllLibraryGames;

}