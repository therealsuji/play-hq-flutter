import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/common_models/user_games_model.dart';


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

  List<UserGamesModel> get selectedGameList;

  void addSelectedGame(UserGamesModel game);

  void performAPIRequest();

  int? get genreCount;

  int get totalPlatformCount;

  int? get releaseDateCount;

}