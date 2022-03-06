

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
    _discoverAPI.fetchNewlyReleasedGames().then((value) {
      _newlyReleasedGames = value.results ?? [];
      notifyListeners();
    });
  }

  @override
  List<Result> get newlyReleasedGames => _newlyReleasedGames;

}