import 'dart:async';

import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/models/common_models/user_games_model.dart';
import 'package:play_hq/models/onboarding_models/setup_purchase_models/wishlist_games_model.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/view_models/custom_search/custom_search_model.dart';

class ICustomSearchModel extends CustomSearchModel{

  bool _isClicked = false;
  List<GameDetails> _searchedGames = [];
  List<UserGamesModel> _wishListGames = [];
  final _networkCalls = Network.shared;
  late SearchGame value;
  SearchScreenStates _screenStates = SearchScreenStates.EMPTY;
  SearchGameScreens? _gameScreens;
  Timer? _debounce;

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
  List<UserGamesModel> get wishListGameList => _wishListGames;

  @override
  void addGameType(SearchGameScreens states) {
    _gameScreens = states;
    notifyListeners();
  }



}