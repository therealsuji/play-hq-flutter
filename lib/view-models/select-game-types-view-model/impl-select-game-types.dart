

import 'package:play_hq/models/genre_model.dart';
import 'package:play_hq/view-models/select-game-types-view-model/select-game-types-model.dart';

class ImplSelectGameTypes extends SelectGameTypesModel{

  bool _currentState = false;
  List<int> _selectedItems = [];
  List<GenreModel> _selectedGenres= [];


  @override
  void changeState(bool state) {
    _currentState = state;
    notifyListeners();
  }

  @override
  // TODO: implement currentState
  bool get currentState => _currentState;

  @override
  void addSelectedItems(index) {
    if(_selectedItems.contains(index)) {
      _selectedItems.remove(index);
    }else{
      _selectedItems.add(index);
    }
    notifyListeners();
  }

  @override
  // TODO: implement selectedItems
  List<int> get selectedItems => _selectedItems;

  @override
  // TODO: implement selectedList
  List<GenreModel> get selectedList => throw UnimplementedError();

}
