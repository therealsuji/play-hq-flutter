

import 'package:play_hq/models/app-genre-model.dart';
import 'package:play_hq/view-models/select-game-types-view-model/select-game-types-model.dart';

class ImplSelectGameTypes extends SelectGameTypesModel{

  bool _currentGenreState = false;
  bool _currentPlatformState = false;
  bool _currentReleaseDateState = false;
  List<int> _selectedGenres = [];
  List<int> _selectedPlatforms = [];
  List<int> _selectedReleaseDates = [];

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

}
