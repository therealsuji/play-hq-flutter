


import 'dart:async';

import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/networks/app-network.dart';
import 'package:play_hq/models/search-model/app-search-game-model.dart';
import 'package:play_hq/view-models/search-game/search-game-view-model.dart';

class ImplSearchGames extends SearchGameModel{

  final _networkCalls = Network.shared;
  late SearchGame value;
  List<GameDetails> _searchedGames = [];
  SearchScreenStates _screenStates = SearchScreenStates.EMPTY;
  Timer? _debounce;

  @override
  // TODO: implement gameList
  List<GameDetails> get gameList => _searchedGames;

  @override
  void searchGames(String name) async{
    _screenStates = SearchScreenStates.LOADING;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async{
      try{
        _searchedGames.clear();
        value = await _networkCalls.searchGame(name);
        if(value.data!.isEmpty){
          _screenStates = SearchScreenStates.NOTHING;
        }else{
          value.data!.forEach((element) {
            _searchedGames.add(element);
          });
          _screenStates = SearchScreenStates.SUCCESS;
        }
      }catch (error){
        _screenStates = SearchScreenStates.FAILED;
        print(error);
      }
      notifyListeners();
    });
    notifyListeners();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  // TODO: implement states
  SearchScreenStates get states => _screenStates;

}