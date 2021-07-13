

import 'package:play_hq/models/app-genre-model.dart';
import 'package:play_hq/view-models/select-game-types-view-model/select-game-types-model.dart';

class ImplSelectGameTypes extends SelectGameTypesModel{

  bool _currentGenreState = false;
  bool _currentPlatformState = false;
  List<int> _selectedGenres = [];
  List<int> _selectedPlatforms = [];

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
      print('Removed');
    }else{
      _selectedPlatforms.add(index);
      print('Added');
    }
    notifyListeners();
  }

  @override
  // TODO: implement selectedPlatforms
  List<int> get selectedPlatforms => _selectedPlatforms;

}
