import 'package:flutter/cupertino.dart';
import 'package:play_hq/helpers/app_loading.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/common_models/game_preferences/request_body.dart';


abstract class SetupPurchaseAccountModel extends ChangeNotifier with AppLoader{

  bool get currentGenreState;

  void changeGenreState(bool state);

  bool get currentPlatFormState;

  void changePlatformState(bool state);

  bool get currentReleaseDateState;

  void changeReleaseDateState(bool state);

  List<int> get selectedGenres;

  void addSelectedGenres(int genreName);

  void updatePreferences();

  List<int> get selectedPlatforms;

  void addSelectedPlatforms(int platform);

  List<String> get selectedReleaseDates;

  void addReleaseDates(String releaseDates);

  List<GamePreferencesRequest> get selectedGameList;

  void addSelectedGame(GamePreferencesRequest game);

  void loadDetails();

  void performAPIRequest();

}