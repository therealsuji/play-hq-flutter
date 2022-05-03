import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/common_models/game_preference_model.dart';


abstract class SetupPurchaseAccountModel with ChangeNotifier{

  bool get currentGenreState;

  void changeGenreState(bool state);

  bool get currentPlatFormState;

  void changePlatformState(bool state);

  bool get currentReleaseDateState;

  void changeReleaseDateState(bool state);

  List<int> get selectedGenres;

  void addSelectedGenres(index , Map<String, dynamic> genre);

  List<int> get selectedPlatforms;

  void addSelectedPlatforms(int index,  Map<String, dynamic> platform);

  List<int> get selectedReleaseDates;

  void addReleaseDates(int index , Map<String, dynamic> releaseDates);

  List<GamePreferences> get selectedGameList;

  void addSelectedGame(GamePreferences game);

  void performAPIRequest();

  int? get genreCount;

  int get totalPlatformCount;

  int? get releaseDateCount;



}