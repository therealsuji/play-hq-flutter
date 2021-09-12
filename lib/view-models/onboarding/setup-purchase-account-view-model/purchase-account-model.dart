

import 'package:flutter/cupertino.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/models/app-genre-model.dart';
import 'package:play_hq/models/onboarding-models/setup-purchase-model.dart';
import 'package:play_hq/models/search-model/app-search-game-model.dart';

abstract class SetupPurchaseAccountModel with ChangeNotifier{

  bool get currentGenreState;

  void changeGenreState(bool state);

  bool get currentPlatFormState;

  void changePlatformState(bool state);

  bool get currentReleaseDateState;

  void changeReleaseDateState(bool state);

  List<int> get selectedGenres;

  void addSelectedGenres(index);

  List<int> get selectedPlaystationPlatforms;

  List<int> get selectedXboxPlatforms;

  List<int> get selectedNintendoPlatforms;

  void addSelectedPlatforms(int index,  PlatformSelection platformSelection);

  List<int> get selectedReleaseDates;

  void addReleaseDates(int index , String? releaseDate);

  List<GameDetails> get selectedGameList;

  void addSelectedGame(GameDetails game);

  int? get genreCount;

  int get totalPlatformCount;

  int? get releaseDateCount;

}