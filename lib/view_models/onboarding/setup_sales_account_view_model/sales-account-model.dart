import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:play_hq/models/common_models/user_games_model.dart';
import 'package:play_hq/models/onboarding_models/setup_purchase_models/wishlist_games_model.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';

abstract class SetupSalesModel with ChangeNotifier{

  List<UserGamesModel> get selectedGameList;

  void addSelectedGame(UserGamesModel game);

  void addLocation(String location);

  String get selectedAddress;

  void selectedMapLocation(LatLng tappedPoint);

  void performAPIRequest();


}