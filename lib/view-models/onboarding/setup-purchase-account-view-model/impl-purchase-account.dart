

import 'dart:async';

import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/helpers/networks/app-network.dart';
import 'package:play_hq/models/app-genre-model.dart';
import 'package:play_hq/models/app-search-game-model.dart';
import 'package:play_hq/view-models/onboarding/setup-purchase-account-view-model/purchase-account-model.dart';

class ImplSelectGameTypes extends SelectGameTypesModel{

  final _networkCalls = Network.shared;
  bool _currentGenreState = false;
  bool _currentPlatformState = false;
  bool _currentReleaseDateState = false;
  SearchGame value;
  List<int> _selectedGenres = [];
  List<int> _selectedPlatforms = [];
  List<int> _selectedReleaseDates = [];
  List<GameDetails> _searchedGames = [];
  List<GameDetails> _selectedGames = [];
  SearchScreenStates _screenStates = SearchScreenStates.EMPTY;
  Timer _debounce;


  @override
  void changeGenreState(bool state) {
    _currentGenreState = state;
    notifyListeners();
  }

  @override
  // TODO: implement currentState
  bool get currentGenreState => _currentGenreState;

  @override
  void addSelectedGenres(index) {
    if(_selectedGenres.contains(index)) {
      _selectedGenres.remove(index);
    }else{
      _selectedGenres.add(index);
    }
    notifyListeners();
  }

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
  void addSelectedPlatforms(int index) {
    if(_selectedPlatforms.contains(index)) {
      _selectedPlatforms.remove(index);
    }else{
      _selectedPlatforms.add(index);
    }
    notifyListeners();
  }

  @override
  // TODO: implement selectedPlatforms
  List<int> get selectedPlatforms => _selectedPlatforms;

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
  // TODO: implement selectedReleaseDates
  List<int> get selectedReleaseDates => _selectedReleaseDates;

  @override
  // TODO: implement gameList
  List<GameDetails> get gameList => _searchedGames;

  @override
  void searchGames(String name) async{
      _screenStates = SearchScreenStates.LOADING;
      if (_debounce?.isActive ?? false) _debounce.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () async{
        try{
          _searchedGames.clear();
          value = await _networkCalls.searchGame(name);
          if(value.data.isEmpty){
            _screenStates = SearchScreenStates.NOTHING;
          }else{
            value.data.forEach((element) {
              _searchedGames.add(element);
            });
            _screenStates = SearchScreenStates.SUCCESS;
          }
        }catch (error){
          _screenStates = SearchScreenStates.FAILED;
        }
        notifyListeners();
      });
      notifyListeners();
  }

  @override
  void addSelectedGame(GameDetails game) {
    _selectedGames.add(game);
    notifyListeners();
  }


  @override
  // TODO: implement states
  SearchScreenStates get states => _screenStates;

  @override
  // TODO: implement selectedGameList
  List<GameDetails> get selectedGameList => _selectedGames;

}
