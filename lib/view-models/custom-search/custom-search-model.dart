

import 'package:flutter/cupertino.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/models/search-model/app-search-game-model.dart';

abstract class CustomSearchModel with ChangeNotifier{

  bool get isCLicked;

  void onClicked(bool click);

  List<GameDetails> get gameList;

  void searchGames(String name);

  SearchScreenStates get states;

}