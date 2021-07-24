

import 'dart:async';

import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/helpers/networks/app-network.dart';
import 'package:play_hq/models/app-genre-model.dart';
import 'package:play_hq/models/app-search-game-model.dart';
import 'package:play_hq/view-models/onboarding/setup-purchase-account-view-model/purchase-account-model.dart';

class ImplSetupPurchaseAccount extends SetupPurchaseAccountModel{

  bool _currentGenreState = false;
  bool _currentPlatformState = false;
  bool _currentReleaseDateState = false;

  int _genreCount;
  int _platformCount = 0;

  List<int> _selectedGenres = [];
  List<int> _selectedPlaystationPlatforms = [];
  List<int> _selectedXboxPlatforms = [];
  List<int> _selectedNintendoPlatforms = [];
  List<int> _selectedReleaseDates = [];
  List<GameDetails> _selectedGames = [];

  // TODO : This is the Genre Selection Methods
  @override
  void addSelectedGenres(index) {
    if(_selectedGenres.contains(index)) {
      _selectedGenres.remove(index);
    }else{
      if(_selectedGenres.length >= 5){
        return;
      }else{
        _selectedGenres.add(index);
      }
    }
    _genreCount = _selectedGenres.length;
    notifyListeners();
  }

  @override
  void changeGenreState(bool state) {
    _currentGenreState = state;
    notifyListeners();
  }

  @override
  bool get currentGenreState => _currentGenreState;

  @override
  // TODO: implement selectedItems
  List<int> get selectedGenres => _selectedGenres;

  @override
  void changePlatformState(bool state) {
    _currentPlatformState = state;
    notifyListeners();
  }

  @override
  // TODO: implement currentPlatFormState
  bool get currentPlatFormState => _currentPlatformState;

  @override
  void addSelectedPlatforms(int index , PlatformSelection platformSelection) {

      switch (platformSelection) {
        case PlatformSelection.PlayStation:
          if(_selectedPlaystationPlatforms.contains(index)) {
            _selectedPlaystationPlatforms.remove(index);
          }else{
            if(_platformCount <=4){
              _selectedPlaystationPlatforms.add(index);
            }else{
              return;
            }
          }
          break;
        case PlatformSelection.Xbox:
          if(_selectedXboxPlatforms.contains(index)) {
            _selectedXboxPlatforms.remove(index);
          }else{
            if(_platformCount <= 4){
              _selectedXboxPlatforms.add(index);
            }else{
              return;
            }
          }
          break;
        case PlatformSelection.Nintendo:
          if(_selectedNintendoPlatforms.contains(index)) {
            _selectedNintendoPlatforms.remove(index);
          }else{
            if(_platformCount <= 4){
              _selectedNintendoPlatforms.add(index);
            }else{
              return;
            }
          }
          break;
        default:
          return;
      }
    _platformCount = _selectedPlaystationPlatforms.length + _selectedXboxPlatforms.length + _selectedNintendoPlatforms.length;
    notifyListeners();
  }

  @override
  // TODO: implement selectedPlatforms
  List<int> get selectedPlaystationPlatforms => _selectedPlaystationPlatforms;

  @override
  void changeReleaseDateState(bool state) {
    _currentReleaseDateState = state;
    notifyListeners();
  }

  @override
  // TODO: implement currentReleaseDateState
  bool get currentReleaseDateState => _currentReleaseDateState;

  @override
  void addReleaseDates(int index) {
    if(_selectedReleaseDates.contains(index)) {
      _selectedReleaseDates.remove(index);
    }else{
      _selectedReleaseDates.add(index);
    }
    notifyListeners();
  }

  @override
  List<int> get selectedReleaseDates => _selectedReleaseDates;

  @override
  void addSelectedGame(GameDetails game) {
    _selectedGames.add(game);
    notifyListeners();
  }

  @override
  List<GameDetails> get selectedGameList => _selectedGames;

  @override
  int get genreCount => _genreCount;

  @override
  // TODO: implement totalPlatformCount
  int get totalPlatformCount => _platformCount;

  @override
  // TODO: implement selectedNintendoPlatforms
  List<int> get selectedNintendoPlatforms => _selectedNintendoPlatforms;

  @override
  // TODO: implement selectedXboxPlatforms
  List<int> get selectedXboxPlatforms => _selectedXboxPlatforms;

}
