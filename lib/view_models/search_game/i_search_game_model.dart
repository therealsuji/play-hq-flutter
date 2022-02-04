import 'dart:async';

import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/view_models/search_game/search_game_model.dart';

class ISearchGamesModel extends SearchGameModel {
  final _networkCalls = Network.shared;
  late SearchGame value;
  List<GameDetails> _searchedGames = [];
  SearchScreenStates _screenStates = SearchScreenStates.EMPTY;
  Timer? _debounce;

  @override
  // TODO: implement gameList
  List<GameDetails> get gameList => _searchedGames;

  @override
  void searchGames(String name) async {
    _screenStates = SearchScreenStates.LOADING;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        _searchedGames.clear();
        value = await _networkCalls.searchGame(name);
        if (value.data!.isEmpty) {
          _screenStates = SearchScreenStates.NOTHING;
        } else {
          value.data!.forEach((element) {
            _searchedGames.add(element);
          });
          _screenStates = SearchScreenStates.SUCCESS;
        }
      } catch (error) {
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

  @override
  void addPlatform(int index, int platformId) {

  }

  @override
  int get selectedPlatform => throw UnimplementedError();

}
