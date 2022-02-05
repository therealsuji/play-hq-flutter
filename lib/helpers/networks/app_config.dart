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
        _baseUrl = "https://play-hq.herokuapp.com";
        break;
    }
  }

  //authenticate user
  static String login = '$_baseUrl' + "/firebase/auth";

  static String renewJwt = '$_baseUrl' + "/firebase/renew-token";

  static String createSale = '$_baseUrl' + "/sell-games";

  static String setupPurchase = '$_baseUrl' + "/user/set-preferences";

  static String setupSales = '$_baseUrl' + "/user/set-details";

  static String addWishListGames = '$_baseUrl' + "/wish-list-games/set";

  static String get addLibraryGames => '$_baseUrl' + '/library-games/set';

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

  static String get addToWishList => '$_baseUrl' + '/wish-list-games/set';

  static String getWishListGames() {
    return '$_baseUrl' + '/wish-list-games';
  }

  static String getLibraryGames() {
    return '$_baseUrl' + '/library-games';
  }
}
