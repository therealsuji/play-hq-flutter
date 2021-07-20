

import 'package:flutter/cupertino.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/models/app-genre-model.dart';
import 'package:play_hq/models/app-search-game-model.dart';

abstract class SelectGameTypesModel with ChangeNotifier{

  bool get currentGenreState;

  void changeGenreState(bool state);

  bool get currentPlatFormState;

  void changePlatformState(bool state);

  bool get currentReleaseDateState;

  void changeReleaseDateState(bool state);

  List<int> get selectedGenres;

  void addSelectedGenres(index);

  List<int> get selectedPlatforms;

  void addSelectedPlatforms(int index);

  List<int> get selectedReleaseDates;

  void addReleaseDates(int index);

  List<GameDetails> get gameList;

  void searchGames(String name);

  SearchScreenStates get states;

  List<GameDetails> get selectedGameList;

  void addSelectedGame(GameDetails game);

}