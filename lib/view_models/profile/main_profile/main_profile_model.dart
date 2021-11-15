


import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';

abstract class MainProfileModel with ChangeNotifier {

  List<GameDetails> get selectedGameList;

  void addSelectedGame(GameDetails game);

}