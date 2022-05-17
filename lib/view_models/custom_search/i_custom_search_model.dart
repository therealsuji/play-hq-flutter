import 'dart:async';

import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/common_models/game_preferences/request_body.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/custom_search/custom_search_model.dart';

import '../../repository/clients/search_repository.dart';
import '../../service_locator.dart';

class ICustomSearchModel extends CustomSearchModel{

  bool _isClicked = false;
  List<GameDetails> _searchedGames = [];
  List<GameModel> _wishListGames = [];
  late SearchGame value;
  late GameModel game;
  SearchScreenStates _screenStates = SearchScreenStates.EMPTY;
  SearchType? _gameScreens;
  Timer? _debounce;

  SearchRepository _searchGameAPI = locator<SearchRepository>();

  late GamePreferencesRequest _gameDetails;
  late GameElement _saleElementDetails;

  int _selectedPlatform = 10;
  int _selectedPlatformId = 0;

  int _selectedGameCondition = 10;
  String _gameConditionSlug = '';

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
        value = await _searchGameAPI.searchGame(name);
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

  void addGameType(SearchType states) {
    _gameScreens = states;
    notifyListeners();
  }

  @override
  void addPlatform(int index, int platformId) {
    _selectedPlatform = index;
    _selectedPlatformId = platformId;
    notifyListeners();
  }

  GameModel addGamesToModel(GameDetails gameDetails){
    List<int>? platformID = [];
    List<int>? genreID = [];
    List<String>? images = [];


    if(gameDetails.platforms != null){
      gameDetails.platforms!.forEach((element) {
        platforms.forEach((platform) {
          if(element.platform!.id == platform['id']){
            platformID.add(element.platform!.id ?? 0);          }
        });
      });
    }

    if(gameDetails.genres != null){
      gameDetails.genres!.forEach((element) {
        genreID.add(element.id);
      });
    }
    GameModel gameItem = GameModel(
        title: gameDetails.name,
        releaseDate: gameDetails.released,
        apiId: gameDetails.id,
        boxCover: gameDetails.image,
        genres: genreID,
        backgroundImage: gameDetails.image,
        images: images,
        platforms: platformID);
    return gameItem;
  }

  @override
  int get selectedPlatform => _selectedPlatform;

  @override
  int get selectedPlatformId => _selectedPlatformId;

  @override
  void addGameCondition(int index, String slug) {
    _selectedGameCondition = index;
    _gameConditionSlug = slug;
    notifyListeners();
  }

  @override
  int get selectedGameCondition => _selectedGameCondition;

  @override
  String get selectedGameConditionSlug => _gameConditionSlug;

  @override
  void addGameToList(int index) {
    game = addGamesToModel(_searchedGames[index]);
    _gameDetails = GamePreferencesRequest(game: game , platform: _selectedPlatformId);
    locator<NavigationService>().pop(args: _gameDetails);
  }



  @override
  GamePreferencesRequest get gameDetails => _gameDetails;

  @override
  void addGameToSale(int index) {
    game = addGamesToModel(_searchedGames[index]);
    _saleElementDetails = GameElement(game: game , status: _gameConditionSlug);
    locator<NavigationService>().pop(args: _saleElementDetails);
  }

}