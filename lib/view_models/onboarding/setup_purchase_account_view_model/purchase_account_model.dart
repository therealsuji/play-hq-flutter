import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/common_models/game_preferences/request_body.dart';


abstract class SetupPurchaseAccountModel with ChangeNotifier{

  bool get currentGenreState;

  void changeGenreState(bool state);

  bool get currentPlatFormState;

  void changePlatformState(bool state);

  void selectPlatform(int platformId);

  int get platformId;

  bool get currentReleaseDateState;

  void changeReleaseDateState(bool state);

  List<int> get selectedGenres;

  void addSelectedGenres(index , Map<String, dynamic> genre);

  List<int> get selectedPlatforms;

  void addSelectedPlatforms(int index,  Map<String, dynamic> platform);

  List<int> get selectedReleaseDates;

  void addReleaseDates(int index , Map<String, dynamic> releaseDates);

  List<GamePreferencesRequest> get selectedGameList;

  void addSelectedGame(GamePreferencesRequest game);

  void performAPIRequest();

  int? get genreCount;

  int get totalPlatformCount;

  int? get releaseDateCount;



}