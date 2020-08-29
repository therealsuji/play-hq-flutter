import 'dart:async';

import 'package:play_hq/blocs/nav_bloc.dart';
import 'package:rxdart/rxdart.dart';

class CreateTradeBloc{

  BehaviorSubject<int> _selectedItemIndex = BehaviorSubject<int>.seeded(30);
  Stream<int> get getSelectedIndex => _selectedItemIndex.stream;
  StreamController<int> _selectedIndexController = StreamController();
  Sink<int> get setSelectedItemIndex => _selectedIndexController.sink;

  CreateTradeBloc(){

    _selectedIndexController.stream.listen((event) {
      _selectedItemIndex.add(event);
    });

  }

  void dispose(){
    _selectedItemIndex.close();
    _selectedIndexController.close();
  }
}