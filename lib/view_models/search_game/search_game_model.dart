import 'package:flutter/cupertino.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';

abstract class SearchGameModel with ChangeNotifier{

  List<GameDetails> get gameList;

  void searchGames(String name);

  SearchScreenStates get states;

  void addPlatform(int index, int platformId);

  int get selectedPlatform;
}