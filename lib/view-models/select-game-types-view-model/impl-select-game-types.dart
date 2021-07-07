

import 'package:play_hq/view-models/select-game-types-view-model/select-game-types-model.dart';

class ImplSelectGameTypes extends SelectGameTypesModel{

  bool _currentState = false;

  @override
  void changeState(bool state) {
    _currentState = state;
    notifyListeners();
  }

  @override
  // TODO: implement currentState
  bool get currentState => _currentState;

}
