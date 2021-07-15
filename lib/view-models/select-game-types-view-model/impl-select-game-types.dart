

import 'package:play_hq/helpers/networks/app-network.dart';
import 'package:play_hq/models/app-genre-model.dart';
import 'package:play_hq/models/app-search-game-model.dart';
import 'package:play_hq/view-models/select-game-types-view-model/select-game-types-model.dart';

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
    _searchedGames.clear();
    try{
      value = await _networkCalls.searchGame(name);
      print(value.data.length);
    }catch (error){
      print(error);
    }
  }

}
