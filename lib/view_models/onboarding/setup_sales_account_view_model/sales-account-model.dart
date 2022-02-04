import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:play_hq/models/common_models/user_games_model.dart';
import 'package:play_hq/models/common_models/game_preferance_model.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';

abstract class SetupSalesViewModel with ChangeNotifier{

  void addLocation(String location);

  String get selectedAddress;

  void selectedMapLocation(LatLng tappedPoint);

  List<GamePreferances> get selectedGameList;

  void addSelectedGame(GamePreferances game);

  void performAPIRequest();


}