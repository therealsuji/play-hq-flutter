import 'package:event_bus/event_bus.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/repository/clients/home_screen_repository.dart';
import 'package:play_hq/view_models/home_screen/home_screen_model.dart';

class IHomeScreenModel extends HomeScreenModel {

  final _homeApi = locator<HomeRepository>();
  final _eventBus = locator<EventBus>();


  int _carouselPageIndex = 0;
  List<SalesPayload> _wishListGames = [];

  @override
  void onCarouselPageChanged(int index) {
    _carouselPageIndex = index;
    notifyListeners();
  }

  @override
  void loadAPICalls() async{

    try{
      _eventBus.fire(LoadingEvent.show());

      // await _homeApi.fetchSalesFromWishlist().then((value) {
      //   if(value.length > 0){
      //     _wishListGames = value;
      //   }
      //   _eventBus.fire(LoadingEvent.hide());
      //   notifyListeners();
      // });
    }catch(e){
      print(e);
      _eventBus.fire(LoadingEvent.hide());
    }
  }

  @override
  int get carouselPageIndex => _carouselPageIndex;

  @override
  List<SalesPayload> get wishListGames => _wishListGames;
}
