import 'package:flutter/cupertino.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';

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