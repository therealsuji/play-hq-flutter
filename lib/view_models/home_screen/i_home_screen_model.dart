import 'dart:convert';
import 'dart:ffi';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:play_hq/helpers/app_save_locally.dart';
import 'package:play_hq/models/common_models/location_model.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/models/sales/my_sales_payload.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/repository/clients/home_screen_repository.dart';
import 'package:play_hq/view_models/home_screen/home_screen_model.dart';

class IHomeScreenModel extends HomeScreenModel {

  final _homeApi = locator<HomeRepository>();
  final _eventBus = locator<EventBus>();

  int _carouselPageIndex = 0;
  List<SalesPayload> _wishListGames = [];
  List<SalesPayload> _soloGames = [];
  List<SalesPayload> _bundleGames = [];

  @override
  void onCarouselPageChanged(int index) {
    _carouselPageIndex = index;
    notifyListeners();
  }

  @override
  void loadAPICalls() async{
    bool cachedData = await APICacheManager().isAPICacheKeyExist('wishlistGames');
    bool cachedData2 = await APICacheManager().isAPICacheKeyExist('soloGames');
    bool cachedData3 = await APICacheManager().isAPICacheKeyExist('bundleGames');
    if(cachedData && cachedData3) {
      APICacheDBModel wishListCache = await APICacheManager().getCacheData('wishlistGames');
      // APICacheDBModel soloCache = await APICacheManager().getCacheData('soloGames');
      APICacheDBModel bundleGamesCache = await APICacheManager().getCacheData('bundleGames');
      _wishListGames = listSalesPayloadFromJson(wishListCache.syncData);
      _bundleGames = listSalesPayloadFromJson(bundleGamesCache.syncData);
    } else{
      try{
        _eventBus.fire(LoadingEvent.show());
        await _homeApi.getSalesFromWishList().then((value) {
          if(value.saleItems!.length > 0){
            APICacheManager().addCacheData(APICacheDBModel(key: 'wishlistGames', syncData: mySalesPayloadToJson(value)));
            _wishListGames = value.saleItems!;
          }
        });
        await _homeApi.getSoloGames().then((val){
          if(val.saleItems!.length > 0) {
            APICacheManager().addCacheData(APICacheDBModel(key: 'soloGames', syncData: mySalesPayloadToJson(val)));
            _soloGames = val.saleItems ?? [];
          }
        });
        await _homeApi.getBundleGames().then((game) {
          if(game.saleItems!.length > 0){
            APICacheManager().addCacheData(APICacheDBModel(key: 'bundleGames', syncData: mySalesPayloadToJson(game)));
            _bundleGames = game.saleItems ?? [];
          }
        });
        notifyListeners();
        _eventBus.fire(LoadingEvent.hide());
      }catch(e){
        print("Error Given " + e.toString());
        _eventBus.fire(LoadingEvent.hide());
      }
    }
  }

  @override
  int get carouselPageIndex => _carouselPageIndex;

  @override
  List<SalesPayload> get wishListGames => _wishListGames;

  @override
  List<SalesPayload> get soloGames => _soloGames;

  @override
  List<SalesPayload> get bundleGames => _bundleGames;
}
