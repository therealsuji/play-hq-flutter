

import 'app-configurations.dart';

class ConfigData {
  //Base url and version are private and not exposed
  static String _rawgAPI;
  static String _baseUrl;
  static String _RAWG_API_KEY = 'be9f8d00d9d04aa6b1b3f6ee26f305b4';

  // static const _VERSION = "api-version=1";

  static void setBaseUrl(Environment environment) {
    switch (environment) {
      case Environment.DEV:
        _rawgAPI = "https://api.rawg.io/api";
        _baseUrl = "http://localhost:1337";
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

  static String getGenres = '$_rawgAPI' + '/genres?ordering=&page=1&page_size=30&' + 'key=$_RAWG_API_KEY';
}
