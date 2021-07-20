

import 'package:flutter/cupertino.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/models/app-search-game-model.dart';

abstract class SearchGameModel with ChangeNotifier{

  List<GameDetails> get gameList;

  void searchGames(String name);

  SearchScreenStates get states;

}