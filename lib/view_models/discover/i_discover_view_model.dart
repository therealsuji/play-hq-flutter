

import 'package:play_hq/models/common_models/date_filter_model.dart';
import 'package:play_hq/models/rawg_models/rawg_game_details.dart';
import 'package:play_hq/repository/clients/discover_repository.dart';
import 'package:play_hq/repository/clients/home_screen_repository.dart';
import 'package:play_hq/view_models/discover/discover_view_model.dart';

import '../../service_locator.dart';

class IDiscoverViewModel extends DiscoverViewModel{

  final _discoverAPI = locator<DiscoverRepository>();

  List<Result> _newlyReleasedGames = [];

  @override
  void fetchNewlyReleasedGames() {


    String month = DateTime.now().month.toString();
    String startMonth = (int.parse(month) - 2)  > 10 ? (int.parse(month) - 2).toString() : '0${(int.parse(month) - 2).toString()}';
    String endMonth = int.parse(month) > 10 ? month : '0$month';
    String year = DateTime.now().year.toString();

    DateFilter dateFilter = DateFilter(startMonth: startMonth, endMonth: endMonth, year: year);

    _discoverAPI.fetchNewlyReleasedGames(dateFilter).then((value) {
      _newlyReleasedGames = value.results ?? [];
      notifyListeners();
    });
  }

  @override
  List<Result> get newlyReleasedGames => _newlyReleasedGames;

}