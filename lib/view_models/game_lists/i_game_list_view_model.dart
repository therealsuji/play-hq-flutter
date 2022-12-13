import 'package:event_bus/event_bus.dart';

import '../../models/loading_event_model.dart';
import '../../models/rawg_models/rawg_game_details.dart';
import '../../repository/clients/game_list_repository.dart';
import '../../injection_container.dart';
import 'game_list_view_model.dart';

class IGameListViewModel extends GameListViewModel {
  final _gameListAPI = sl<GameListRepository>();
  final _eventBus = sl<EventBus>();
  int _pageSize = 9;
  List<GameResults> _gameResponse = [];

  @override
  void fetchTopRatedGames() async {
    try {
      _eventBus.fire(LoadingEvent.show());

      await _gameListAPI.fetchTopRatedGames().then((value) {
        _gameResponse = value.results ?? [];
        notifyListeners();
      });

      print('Top Rated Games: ${_gameResponse.length}');

      _eventBus.fire(LoadingEvent.hide());
    } catch (e) {
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

  @override
  List<GameResults> get gameResponse => _gameResponse;

  @override
  void fetchGamesOf2022() async {
    try {
      _eventBus.fire(LoadingEvent.show());

      await _gameListAPI.fetchUpcomingGames().then((value) {
        _gameResponse = value.results ?? [];
        notifyListeners();
      });

      print('Top Rated Games: ${_gameResponse.length}');

      _eventBus.fire(LoadingEvent.hide());
    } catch (e) {
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

  @override
  void fetchUpcomingGames() async {
    try {
      _eventBus.fire(LoadingEvent.show());

      await _gameListAPI.fetchGamesOf2022().then((value) {
        _gameResponse = value.results ?? [];
        notifyListeners();
      });

      print('Top Rated Games: ${_gameResponse.length}');

      _eventBus.fire(LoadingEvent.hide());
    } catch (e) {
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

  @override
  void fetchGamesFromGenre(String genre) async {
    try {
      _eventBus.fire(LoadingEvent.show());

      await _gameListAPI.fetchGamesFromGenre(_pageSize, genre).then((value) {
        _gameResponse = value.results ?? [];
        notifyListeners();
      });

      _eventBus.fire(LoadingEvent.hide());
    } catch (e) {
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

  @override
  void increasePageSize() {
    // TODO: implement increasePageSize
  }

  @override
  void fetchAllRecommendedGames() async{
    try{
      _eventBus.fire(LoadingEvent.show());



    }catch(e){
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }
}
