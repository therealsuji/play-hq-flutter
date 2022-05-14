import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/common_models/game_preferences/request_body.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';

abstract class SetupSalesViewModel with ChangeNotifier{

  void addLocation(String placeId , String address);

  void addPhoneNumber(String phoneNumber);

  void addDisplayName(String displayName);

  String get selectedAddress;

  void selectedMapLocation(LatLng tappedPoint);

  List<GamePreferencesRequest> get selectedGameList;

  void addSelectedGame(GamePreferencesRequest game);

  void performAPIRequest();


}