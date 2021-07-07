

import 'package:play_hq/view-models/select-game-types-view-model/select-game-types-model.dart';

class ImplSelectGameTypes extends SelectGameTypesModel{

  bool _currentState = false;
  List<bool> _selectedItems = [];


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
    if(_selectedItems[index])
    _selectedItems[index] = false;
    else{
      _selectedItems[index] = true;
    }
  }

  @override
  // TODO: implement selectedItems
  List<bool> get selectedItems => _selectedItems;

}
