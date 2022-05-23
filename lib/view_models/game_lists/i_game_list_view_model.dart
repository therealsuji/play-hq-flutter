


import 'package:event_bus/event_bus.dart';
import 'package:play_hq/models/rawg_models/rawg_game_details.dart';
import '../../models/loading_event_model.dart';
import '../../repository/clients/game_list_repository.dart';
import '../../service_locator.dart';
import 'game_list_view_model.dart';

class IGameListViewModel extends GameListViewModel {

  final _gameListAPI = locator<GameListRepository>();
  final _eventBus = locator<EventBus>();

  List<GameResults> _gameResponse = [];

  @override
  void fetchTopRatedGames() async{

    try{
      _eventBus.fire(LoadingEvent.show());

      await _gameListAPI.fetchTopRatedGames().then((value) {
        _gameResponse = value.results ?? [];
        notifyListeners();
      });

      print('Top Rated Games: ${_gameResponse.length}');

      _eventBus.fire(LoadingEvent.hide());

    }catch (e){
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

  @override
  List<GameResults> get gameResponse => _gameResponse;

  @override
  void fetchGamesOf2022() async {
    try{
      _eventBus.fire(LoadingEvent.show());

      await _gameListAPI.fetchUpcomingGames().then((value) {
        _gameResponse = value.results ?? [];
        notifyListeners();
      });

      print('Top Rated Games: ${_gameResponse.length}');

      _eventBus.fire(LoadingEvent.hide());

    }catch (e){
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

  @override
  void fetchUpcomingGames() async {
    try{
      _eventBus.fire(LoadingEvent.show());

      await _gameListAPI.fetchGamesOf2022().then((value) {
        _gameResponse = value.results ?? [];
        notifyListeners();
      });

      print('Top Rated Games: ${_gameResponse.length}');

      _eventBus.fire(LoadingEvent.hide());

    }catch (e){
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

}