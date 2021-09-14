import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';

abstract class SetupSalesModel with ChangeNotifier{

  List<GameDetails> get selectedGameList;

  void addSelectedGame(GameDetails game);

  void addLocation(String location);

  String get selectedAddress;

  void selectedMapLocation(LatLng tappedPoint);


}