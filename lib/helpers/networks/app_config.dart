import 'package:play_hq/models/common_models/date_filter_model.dart';

import 'app_configurations.dart';

class APIConfig {
  //Base url and version are private and not exposed
  static String? _rawgAPI;
  static String? _baseUrl;
  static String _RAWG_API_KEY = 'be9f8d00d9d04aa6b1b3f6ee26f305b4';

  // static const _VERSION = "api-version=1";

  static void setBaseUrl(Environment environment) {
    switch (environment) {
      case Environment.DEV:
        _rawgAPI = "https://api.rawg.io/api";
        _baseUrl = "http://192.168.1.3:1337";
        break;
      case Environment.QA:
        _rawgAPI = "https://api.rawg.io/api";
        _baseUrl = "http://localhost:1337";
        break;
      case Environment.STAGE:
        _rawgAPI = "https://api.rawg.io/api";
        _baseUrl = "https://play-hq-285011.el.r.appspot.com";
        break;
    }
  }

  /// Urls that are needed from the RAWG API
  static String getGenres = '$_rawgAPI' +
      '/genres?ordering=&page=1&page_size=30&' +
      'key=$_RAWG_API_KEY';

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
    return '$_rawgAPI' + '/games?dates=${dateFilter.year}-02-01,${dateFilter.year}-${dateFilter.endMonth}-25' +
        '&page_size=9&key=$_RAWG_API_KEY';
  }

  static String getFPSGames(){
    return '$_rawgAPI' + '/games?dates=2019-09-01,2021-09-30&page_size=9&genres=2&ordering=-added' + '&key=$_RAWG_API_KEY';
  }

  static String getTopRatedGames(){
    return '$_rawgAPI' + '/games?dates=2018-01-01,2022-12-31&ordering=-rating&ordering=-added' + '&key=$_RAWG_API_KEY';
  }

  static String getUpcomingGames(){
    return '$_rawgAPI' + '/games?dates=2022-06-01,2026-12-31&ordering=-added' + '&key=$_RAWG_API_KEY';
  }

  static String getGamesOf2022(){
    return '$_rawgAPI' + '/games?dates=2022-01-01,2022-12-31&ordering=-added' + '&key=$_RAWG_API_KEY';
  }

  /// Urls needed from the PlayHQ Backend
  //authenticate user
  static String login = '$_baseUrl' + "/auth/firebase";
  static String renewJwt = '$_baseUrl' + "/auth/refresh";

  static String getUserDetails = '$_baseUrl' + "/v1/auth/me";

  // Sales API
  static String createSale = '$_baseUrl' + "/sales";
  static String fetchMyActiveSales = '$_baseUrl' + "/sales/get-my-sales";
  static String fetchSalesFromWishlist = '$_baseUrl' + "/sales/from-wish-list";

  static String setupPurchase = '$_baseUrl' + "/users/preferences";

  static String setupSales = '$_baseUrl' + "/users/update";

  // User Games APIs
  static String addWishListGames = '$_baseUrl' + "/wish-list-games/set";

  static String get addLibraryGames => '$_baseUrl' + '/library-games/set';

  static String get addToWishList => '$_baseUrl' + '/wish-list-games';

  static String get addToLibrary => '$_baseUrl' + '/library-games';

  static String get orders => '$_baseUrl' + '/orders';

  static String deleteWishListGame(int id) => '$_baseUrl' + '/wish-list-games/$id';

  static String deleteLibraryGame(int id) => '$_baseUrl' + '/library-games/$id';

  static String getWishListGames() {
    return '$_baseUrl' + '/wish-list-games';
  }

  static String acceptPurchaseRequest(String id) => '$_baseUrl' + '/orders/update-status/seller/$id/ACCEPTED';

  static String rejectPurchaseRequest(String id) => '$_baseUrl' + '/orders/update-status/seller/$id/REJECTED';

  static String getOrdersForSale(String saleId) => '$_baseUrl' + '/orders/orders-for-sale/$saleId';

  static String fetchAllActiveSaleOrders() => '$_baseUrl' + '/orders?type=sale&status=ACCEPTED';

  static String fetchAllActivePurchaseOrders() => '$_baseUrl' + '/orders?type=purchase&status=ACCEPTED';

  static String fetchSoloGames(){
    return '$_baseUrl' + '/sales?order=ASC&page=1&q=example&type=single';
  }

  static String fetchBundleGames(){
    return '$_baseUrl' + '/sales?order=ASC&page=1&q=example&type=bundle';
  }

  static String getLibraryGames() {
    return '$_baseUrl' + '/library-games';
  }

  static String getGameStatus(int id) => '$_baseUrl' + '/list/check/$id';

}
