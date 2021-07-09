

import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/app-genre-model.dart';

abstract class SelectGameTypesModel with ChangeNotifier{

  bool get currentGenreState;

  void changeGenreState(bool state);

  bool get currentPlatFormState;

  void changePlatformState(bool state);

  List<int> get selectedGenres;

  void addSelectedGenres(index);

  List<int> get selectedPlatforms;

  void addSelectedPlatforms(index);

}