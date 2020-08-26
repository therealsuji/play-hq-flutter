import 'dart:async';

import 'package:rxdart/rxdart.dart';

enum NavBar{Home , Discover , Empty, Messages , Profile}

class NavBloc{

  //Control the bottom navigation index changes and fire ui changes
  BehaviorSubject<int> _navigationEventIndex = BehaviorSubject<int>.seeded(0);
  Stream<int> get navigationEvent => _navigationEventIndex.stream;
  StreamController<int> _navigationIndexController = StreamController();
  Sink<int> get setNavigationEvent => _navigationIndexController.sink;

  //Controls the body content changes according to bottom navigation change
  BehaviorSubject<NavBar> _pageChanges = BehaviorSubject<NavBar>();
  Stream<NavBar> get pageChanged => _pageChanges.stream;

  NavBloc(){

    //Set the navigation streams and body content streams based on input index
    _navigationIndexController.stream.listen((index){
      _navigationEventIndex.add(index);
      _pageChanges.add(NavBar.values[index]);
    });
  }

  void dispose(){
    _navigationIndexController.close();
    _navigationEventIndex.close();
    _pageChanges.close();
  }

}