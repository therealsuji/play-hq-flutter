

import 'package:event_bus/event_bus.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/common_models/game_preferance_model.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/repository/clients/main_profile_screen_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/view_models/profile/main_profile/main_profile_model.dart';

class IMainProfileModel extends MainProfileModel {

  final _eventBus = locator<EventBus>();
  final _mainProfileAPI = locator<MainProfileScreenRepository>();

  List<GamePreferances> _wishlistGames = [];
  List<GamePreferances> _libraryGames = [];

  @override
  void getMyGames() async{
    try{
      _eventBus.fire(LoadingEvent.show());

      await _mainProfileAPI.getWishListGames().then((value) {
        if(value.length > 0){
          print("WishList Games: ${value[0].game.title}");
          _wishlistGames = value;
        }
      });
      await _mainProfileAPI.getLibraryGames().then((value) {
        if(value.length > 0){
          print("WishList Games: ${value[0].game.title}");
          _libraryGames = value;
        }
        _eventBus.fire(LoadingEvent.hide());
      });
      notifyListeners();
    }catch(e){
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

  @override
  List<GamePreferances> get fetchAllWishlistGames => _wishlistGames;

  @override
  List<GamePreferances> get fetchAllLibraryGames => _libraryGames;


}