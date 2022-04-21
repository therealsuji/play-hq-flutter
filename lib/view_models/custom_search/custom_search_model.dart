import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/common_models/game_preference_model.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';

abstract class CustomSearchModel with ChangeNotifier{

  bool get isClicked;

  void onClicked(bool click);

  List<GameDetails> get gameList;

  List<GameModel> get wishListGameList;

  void searchGames(String name);

  SearchScreenStates get states;

  void addPlatform(int index, int platformId);

  void addGameCondition(int index, String slug);

  void addGameToList(int index);

  GamePreferences get gameDetails;

  int get selectedGameCondition;

  String get selectedGameConditionSlug;

  int get selectedPlatform;

  int get selectedPlatformId;

}