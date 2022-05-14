


import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/common_models/game_preferences/response_body.dart';

abstract class MainProfileModel with ChangeNotifier {

  List<Data> get fetchAllWishlistGames;

  void getMyGames();

  List<Data> get fetchAllLibraryGames;

}