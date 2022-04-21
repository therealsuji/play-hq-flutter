


import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/common_models/game_preferance_models.dart';

abstract class MainProfileModel with ChangeNotifier {

  List<FakePreferances> get fetchAllWishlistGames;

  void getMyGames();

  List<FakePreferances> get fetchAllLibraryGames;

}