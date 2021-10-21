import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/models/onboarding_models/setup_purchase_models/wishlist_games_model.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';

abstract class CustomSearchModel with ChangeNotifier{

  bool get isClicked;

  void onClicked(bool click);

  List<GameDetails> get gameList;

  List<WishListGameDetails> get wishListGameList;

  void searchGames(String name);

  SearchScreenStates get states;

}