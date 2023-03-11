import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/models/common_models/date_filter_model.dart';
import 'package:play_hq/models/common_models/user/user_game_preferences.dart';
import 'package:play_hq/services/auth_service.dart';

import '../../injection_container.dart';
import 'app_configurations.dart';

class APIConfig {
  //Base url and version are private and not exposed
  static String? _rawgAPI;
  static String? _baseUrl;
  static String? _personalizedBase = '';
  static String _RAWG_API_KEY = 'be9f8d00d9d04aa6b1b3f6ee26f305b4';

  // static const _VERSION = "api-version=1";

  static void setBaseUrl(Environment environment) {
    switch (environment) {
      case Environment.DEV:
        _rawgAPI = "https://api.rawg.io/api";
        _baseUrl = Platform.isAndroid ? "http://10.0.2.2:3001" : "http://localhost:3001";
        break;
      case Environment.QA:
        _rawgAPI = "https://api.rawg.io/api";
        _baseUrl = "http://localhost:1337";
        break;
      case Environment.STAGE:
        _rawgAPI = "https://api.rawg.io/api";
        _baseUrl = "https://playhq-v2-production.up.railway.app";
        break;
    }
  }

  static void setGenreBase() async{
    UserGamePreferences gamePreferences = await sl<AuthService>().getUserGamePreferences();
    String platforms = gamePreferences.platforms.map((obj) => obj.id.toString()).join(',');
    _personalizedBase = '$_rawgAPI' + '/games?platforms=' + platforms + '&page=1&page_size=30&' + 'key=$_RAWG_API_KEY';
    debugPrint('Personalized URL $_personalizedBase');
  }

  /// Urls that are needed from the RAWG API
  static String getGenres =
      '$_rawgAPI' + '/genres?ordering=&page=1&page_size=30&' + 'key=$_RAWG_API_KEY';

  static String getSearchResults(String params) {
    return '$_rawgAPI' + '/games?page=1&search=$params' + '&key=$_RAWG_API_KEY';
  }

  static String gameDetails(int id) {
    return '$_rawgAPI' + '/games/$id' + '?key=$_RAWG_API_KEY';
  }

  static String gameScreenshots(int id) {
    return '$_rawgAPI' + '/games/$id/screenshots' + '?key=$_RAWG_API_KEY';
  }

  static String getNewReleases(DateFilter dateFilter) {
    return '$_rawgAPI' +
        '/games?dates=${dateFilter.year}-02-01,${dateFilter.year}-${dateFilter.endMonth}-25' +
        '&page_size=9&key=$_RAWG_API_KEY';
  }

  static String getFPSGames() {
    return '$_rawgAPI' +
        '/games?dates=2019-09-01,2021-09-30&page_size=9&genres=2&ordering=-added' +
        '&key=$_RAWG_API_KEY';
  }

  static Future<String> getRecommendGamesFromGenres() async {
    UserGamePreferences gamePreferences = await sl<AuthService>().getUserGamePreferences();
    String platforms = gamePreferences.platforms.map((obj) => obj.id.toString()).join(',');
    String genres = gamePreferences.genres.map((obj) => obj.id.toString()).join(',');
    DateTime currentDate = DateTime.now();
    final random = Random(currentDate.millisecondsSinceEpoch ~/ 259200000);
    final random2 = Random();
    final randomPage = random.nextInt(10) + 1;
    return '$_rawgAPI/games?&page=$randomPage&page_size=15&ordering=-released&dates=2019-01-01,${currentDate.year}-${currentDate.month < 10 ? '0${currentDate.month}' : currentDate.month}-20&platforms=$platforms&genres=$genres&key=$_RAWG_API_KEY';
  }

  static String getGamesByGenre(int page, String genre) {
    DateTime currentDate = DateTime.now();
    return '$_rawgAPI/games?dates=${currentDate.year - 5}-01-01,${currentDate.year}-12-31&page_size=$page&genres=$genre&key=$_RAWG_API_KEY';
  }

  static String getSimilarGames(int page, String genre, List<int> platforms) {
    String combinedPlatforms = platforms.join(',');
    DateTime currentDate = DateTime.now();
    return '$_rawgAPI/games?dates=${currentDate.year - 5}-01-01,${currentDate.year}-12-31&page_size=10&genres=$genre&platforms=$combinedPlatforms&key=$_RAWG_API_KEY';
  }


  static String popularThisYear() {
    DateTime currentDate = DateTime.now();
    return '$_rawgAPI/games?dates=${currentDate.year}-01-01,${currentDate.year}-12-31&ordering=popularity&key=$_RAWG_API_KEY';
  }

  static String getTopRatedGames() {
    return '$_rawgAPI' +
        '/games?dates=2018-01-01,2022-12-31&ordering=-rating&ordering=-added' +
        '&key=$_RAWG_API_KEY';
  }

  static Future<String> getUpcomingGames(int size) async{
    DateTime currentDate = DateTime.now();
    UserGamePreferences gamePreferences = await sl<AuthService>().getUserGamePreferences();
    String platforms = gamePreferences.platforms.map((obj) => obj.id.toString()).join(',');
    String genres = gamePreferences.genres.map((obj) => obj.id.toString()).join(',');
    final random2 = Random();
    final randomPage = random2.nextInt(5) + 1;
    var startDateTime =
        '${currentDate.year}-${currentDate.month >= 10 ? currentDate.month : "0${currentDate.month}"}-05';
    var endDateTime = '${currentDate.year + 3}-12-31';
    return '$_rawgAPI/games?dates=$startDateTime,$endDateTime&page=$randomPage&page_size=$size&ordering=-added&platforms=$platforms&genres=$genres&key=$_RAWG_API_KEY';
  }

  static String getGamesOfYear() {
    DateTime currentDate = DateTime.now();
    return '$_rawgAPI' +
        '/games?dates=${currentDate.year}-01-01,${currentDate.year}-12-31&ordering=-added' +
        '&key=$_RAWG_API_KEY';
  }

  /// Urls needed from the PlayHQ Backend
  //authenticate user
  static String login = '$_baseUrl' + "/auth/firebase";

  static String renewJwt = '$_baseUrl' + "/auth/refresh";

  static String getUserDetails = '$_baseUrl' + "/v1/auth/me";


  static String updateUserPreferences = '$_baseUrl' + 'users/preferences';
  static String updateUserDetails = '$_baseUrl' + "/users/update";

  // Sales API
  static String createSale = '$_baseUrl' + "/sales";

  static String getSalesFromGame(int id) => '$_baseUrl' + '/sales/for-game/$id';

  static String fetchMyActiveSales = '$_baseUrl' + "/sales/get-my-sales";
  static String fetchSalesFromWishlist = '$_baseUrl' + "/sales/from-wish-list";

  static String fetchSalesForUsersOrders(
      {int page = 1, required SaleOrderType type, OrderStatus? status}) {
    return "$_baseUrl/sales/get-sales-for-user-orders?page=$page&type=${describeEnum(type).toLowerCase()}" +
        (status != null ? "&status=${describeEnum(status)}" : "");
  }

  static String userPreferences = '$_baseUrl' + "/users/preferences";

  // User Games APIs
  static String addWishListGames = '$_baseUrl' + "/wish-list-games/set";

  static String get addLibraryGames => '$_baseUrl' + '/library-games/set';

  static String get addToWishList => '$_baseUrl' + '/wish-list-games';

  static String get addToLibrary => '$_baseUrl' + '/library-games';

  static String get orders => '$_baseUrl' + '/orders';

  static String deleteWishListGame(int id) => '$_baseUrl' + '/wish-list-games/$id';

  static String deleteLibraryGame(int id) => '$_baseUrl' + '/library-games/$id';

  static String deleteMySale(String id) => '$_baseUrl' + '/sales/$id';

  static String getWishListGames() {
    return '$_baseUrl' + '/wish-list-games';
  }

  static String acceptPurchaseRequest(String id) =>
      '$_baseUrl' + '/orders/update-status/seller/$id/ACCEPTED';

  static String rejectPurchaseRequest(String id) =>
      '$_baseUrl' + '/orders/update-status/seller/$id/REJECTED';

  static String getOrdersForSale(String saleId) => '$_baseUrl' + '/orders/orders-for-sale/$saleId';

  static String fetchAllActiveSaleOrders() => '$_baseUrl' + '/orders?type=sale&status=ACCEPTED';

  static String fetchAllActivePurchaseOrders() =>
      '$_baseUrl' + '/orders?type=purchase&status=ACCEPTED';

  static String changeOrderStatus(
          {int page = 1, OrderStatus? status, UserType? user, String? id}) =>
      '$_baseUrl' +
      '/orders/update-status/${describeEnum(user!).toLowerCase()}/$id/${describeEnum(status!)}';

  static String fetchSoloGames() {
    return '$_baseUrl' + '/sales?order=ASC&page=1&q=example&type=single';
  }

  static String fetchBundleGames() {
    return '$_baseUrl' + '/sales?order=ASC&page=1&q=example&type=bundle';
  }

  static String getLibraryGames() {
    return '$_baseUrl' + '/library-games';
  }

  static String getGameStatus(int id) => '$_baseUrl' + '/list/check/$id';
}
