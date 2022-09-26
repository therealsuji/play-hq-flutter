import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_extensions/http_extensions.dart';
import 'package:http_extensions_cache/http_extensions_cache.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_secure_storage.dart';
import 'package:play_hq/services/auth_service.dart';
import 'package:logging/logging.dart';

class Network {
  //Singleton
  Network._privateConstructor();
  static final Network _instance = Network._privateConstructor();
  static Network get shared => _instance;

  late Client _client;

  Map<String, String> _headers = {
    "User-Agent": 'PlayHQ',
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  //TODO: use this for rawg apis and also add dispose method to close this on app close
  // final cachedClient = ExtendedClient(
  //   inner: Client() as BaseClient,
  //   extensions: [
  //     CacheExtension(
  //         logger: Logger('Cache'),
  //         defaultOptions: CacheOptions(
  //           expiry: const Duration(minutes: 5), // The duration after the cached result of the request will be expired.
  //           forceUpdate: false, // Forces to request a new value, even if an valid cache is available
  //           forceCache: false, // Forces to return the cached value if available (even if expired).
  //           ignoreCache: true, //Indicates whether the request should bypass all caching logic
  //           returnCacheOnError: true,
  //           store: MemoryCacheStore(), // The store used for caching data.
  //           shouldBeSaved: (response) =>
  //               response.statusCode >= 200 &&
  //               response.statusCode <
  //                   300, // A way of filtering responses (for exemple regarding the result status code, or the content length).
  //         )),
  //   ],
  // );

  Future<Response> performRequest(String url, HttpAction action,
      {dynamic body, Map<String, String>? headers, bool noToken = false}) async {
    try {
      _client = Client();
      late var response;

      //Get the jwtToken from secure storage and if existing, add to the header
      String? bearerToken = await SecureStorage.readValue(AuthService.JWT_KEY);
      if (bearerToken != null && !noToken) {
        _headers.addAll({'Authorization': 'Bearer $bearerToken'});
      }

      print('Bearer Token: $bearerToken');

      // Add new headers if there is to add
      if (headers != null && headers.isNotEmpty) {
        _headers.addAll(headers);
      }

      switch (action) {
        case HttpAction.GET:
          response = await _client.get(Uri.parse(url), headers: _headers);
          break;
        case HttpAction.POST:
          response = await _client
              .post(
                Uri.parse(url),
                body: body != null ? json.encoder.convert(body) : "",
                headers: _headers,
              )
              .timeout(Duration(seconds: 8));
          break;
        case HttpAction.POST_ENCODED_URL:
          response = await _client
              .post(
                Uri.parse(url),
                headers: {'Content-Type': "application/x-www-form-urlencoded"},
                body: body,
              )
              .timeout(Duration(seconds: 8));
          break;
        case HttpAction.PUT:
          response = await _client
              .put(
                Uri.parse(url),
                body: body != null ? json.encoder.convert(body) : "",
                headers: _headers,
              )
              .timeout(Duration(seconds: 8));
          break;
        case HttpAction.PATCH:
          response = await _client
              .patch(
                Uri.parse(url),
                body: body != null ? json.encoder.convert(body) : "",
                headers: _headers,
              )
              .timeout(Duration(seconds: 8));
          break;
        case HttpAction.DELETE:
          response = await _client.delete(Uri.parse(url), headers: _headers).timeout(Duration(seconds: 8));
          break;
      }

      print("Status Code: ${response.statusCode} Url: $url");
      print("Response Body: ${response.body}");

      return response;
    } catch (e) {
      rethrow;
    } finally {
      _client.close();
    }
  }
}
