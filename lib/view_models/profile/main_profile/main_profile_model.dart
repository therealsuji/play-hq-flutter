


import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/common_models/game_preferance_model.dart';

abstract class MainProfileModel with ChangeNotifier {

  List<GamePreferances> get fetchAllWishlistGames;

  void getMyGames();

  List<GamePreferances> get fetchAllLibraryGames;

}