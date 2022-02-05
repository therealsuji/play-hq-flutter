import 'dart:async';

import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/common_models/game_preferance_model.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/view_models/custom_search/custom_search_model.dart';

class ICustomSearchModel extends CustomSearchModel{

  bool _isClicked = false;
  List<GameDetails> _searchedGames = [];
  List<GameModel> _wishListGames = [];
  final _networkCalls = Network.shared;
  late SearchGame value;
  SearchScreenStates _screenStates = SearchScreenStates.EMPTY;
  SearchGameScreens? _gameScreens;
  Timer? _debounce;
  int _selectedPlatform = 10;
  int _selectedPlatformId = 0;

  @override
  void onClicked(bool click) {
    _isClicked = click;
    notifyListeners();
  }

  @override
  bool get isClicked => _isClicked;

  @override
  // TODO: implement gameList
  List<GameDetails> get gameList => _searchedGames;

  @override
  void searchGames(String name) {
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
  // TODO: implement states
  SearchScreenStates get states => _screenStates;

  @override
  // TODO: implement wishListGameList
  List<GameModel> get wishListGameList => _wishListGames;

  @override
  void addGameType(SearchGameScreens states) {
    _gameScreens = states;
    notifyListeners();
  }

  @override
  void addPlatform(int index, int platformId) {
    _selectedPlatform = index;
    _selectedPlatformId = platformId;
    notifyListeners();
  }

  @override
  int get selectedPlatform => _selectedPlatform;

  @override
  int get selectedPlatformId => _selectedPlatformId;

}