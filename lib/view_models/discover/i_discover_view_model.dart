

import 'package:event_bus/event_bus.dart';
import 'package:play_hq/models/common_models/date_filter_model.dart';
import 'package:play_hq/models/rawg_models/rawg_game_details.dart';
import 'package:play_hq/repository/clients/discover_repository.dart';
import 'package:play_hq/repository/clients/home_screen_repository.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/view_models/discover/discover_view_model.dart';

import '../../models/loading_event_model.dart';
import '../../service_locator.dart';

class IDiscoverViewModel extends DiscoverViewModel{

  final _discoverAPI = locator<DiscoverRepository>();
  final _eventBus = locator<EventBus>();

  List<GameResults> _newlyReleasedGames = [];
  List<GameResults> _fpsGames = [];

  @override
  void performAPIs() async{

    String month = DateTime.now().month.toString();
    String startMonth = (int.parse(month) - 2)  > 10 ? (int.parse(month) - 2).toString() : '0${(int.parse(month) - 2).toString()}';
    String endMonth = int.parse(month) > 10 ? month : '0$month';
    String year = DateTime.now().year.toString();

    DateFilter dateFilter = DateFilter(startMonth: startMonth, endMonth: endMonth, year: year);

    try{

      _eventBus.fire(LoadingEvent.show());

      await _discoverAPI.fetchNewlyReleasedGames(dateFilter).then((value) {
        _newlyReleasedGames = value.results ?? [];
        notifyListeners();
      });

      await _discoverAPI.fetchFPSGames().then((value) {
        _fpsGames = value.results ?? [];
        notifyListeners();
      });

      _eventBus.fire(LoadingEvent.hide());

    }catch (e){
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }

  }

  @override
  List<GameResults> get newlyReleasedGames => _newlyReleasedGames;

  @override
  List<GameResults> get fpsGames => _fpsGames;

}