import 'package:flutter/material.dart';
import '../../models/rawg_models/rawg_game_details.dart';

abstract class GameListViewModel with ChangeNotifier {
  List<GameResults> get gameResponse;

  void fetchTopRatedGames();

  void fetchUpcomingGames();

  void fetchGamesOf2022();

  void fetchGamesFromGenre(String genre);

  void increasePageSize();
}
