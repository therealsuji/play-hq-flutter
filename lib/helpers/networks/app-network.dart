import 'package:http/http.dart';
import 'package:play_hq/models/game_details_model.dart';
import 'package:play_hq/models/game_screenshot_modal.dart';
import 'package:play_hq/models/search-model/app-search-game-model.dart';
import 'package:play_hq/models/app-user-model.dart';
import 'package:play_hq/models/create-sale-model.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import '../app-secure-storage.dart';
import 'app-config.dart';
import 'app-connectivity.dart';
import 'app-initialize-models.dart';

//Network request models
enum RequestType { get, post, put, patch, delete, postEncodedUrl }

class Network {
  //Singleton
  Network._privateConstructor();
  static final Network _instance = Network._privateConstructor();
  static Network get shared => _instance;

  //check connection status
  late var connectionStatus;
  var _connect = ConnectionCheck.getInstance();

  //http client
  Client client = Client();

  Map<String, String> _headers = {
    "User-Agent": 'PlayHQ',
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<T> _performWebRequest<T>(RequestType type, String url, {dynamic body, bool noToken = false}) async {
    //Response initialization
    late Response response;

    //Get the jwtToken from secure storage and if existing, add to the header
    String? bearerToken = await SecureStorage.readValue("jwtToken");
    print(bearerToken);
    if (bearerToken != null && !noToken) {
      _headers.addAll({'Authorization': 'Bearer $bearerToken'});
    }

    //checks for the connection status and updates boolean
    await _connect.checkConnection().then((status) => connectionStatus = status);
    //runs only if connection exists
    if (connectionStatus) {
      try {
        //Identify the request type
        switch (type) {
          case RequestType.get:
            response = await client.get(Uri.parse(url), headers: _headers);
            break;
          case RequestType.post:
            response = await client.post(Uri.parse(url), headers: _headers, body: json.encoder.convert(body));
            break;
          case RequestType.postEncodedUrl:
            response = await client.post(Uri.parse(url),
                headers: {'Content-Type': "application/x-www-form-urlencoded"}, body: body);
            break;
          case RequestType.put:
            response = await client.put(Uri.parse(url), headers: _headers, body: json.encoder.convert(body));
            break;
          case RequestType.patch:
            response = await client.patch(Uri.parse(url), headers: _headers, body: json.encoder.convert(body));
            break;
          case RequestType.delete:
            response = await client.delete(Uri.parse(url), headers: _headers);
            break;
        }
        print("Network call ${response.statusCode} $url");

        if (response.statusCode == 200) {
          // If the call to the server was successful, parse the JSON and initialize the data model.
          return InitializeData.fromJson<T>(json.decode(response.body));
        } else if (response.statusCode == 204) {
          //server call was successful, no response body
          return InitializeData.fromJson<T>(true);
        } else if (response.statusCode == 401) {
          throw Exception(json.decode(response.body)['title']);
        } else if (response.statusCode == 404) {
          throw Exception(json.decode(response.body)['title']);
        } else if (response.statusCode == 422) {
          throw Exception(json.decode(response.body)['title']);
        } else {
          print(response.body);
          throw Exception('Error'); // If that call was not successful, throw an error.
        }
      } on SocketException catch (e) {
        throw Exception(e);
      }
    } else {
      throw Exception('No interent');
    }
  }

  Future<UserModel> loginUser(token) async {
    return await _performWebRequest<UserModel>(RequestType.post, ConfigData.login,
        body: {"token": token}, noToken: true);
  }

  Future<CreateSalePayload> createSale(CreateSalePayload payload) async {
    return await _performWebRequest<CreateSalePayload>(RequestType.post, ConfigData.createSale, body: payload);
  }

  Future<SearchGame> searchGame(String params) async {
    return await _performWebRequest<SearchGame>(RequestType.get, ConfigData.getSearchResults(params));
  }

  Future<GameDetailsModel> getGameDetails(int id) async {
    return await _performWebRequest<GameDetailsModel>(RequestType.get, ConfigData.gameDetails(id));
  }

  Future<GameScreenshotModal> gameScreenshots(int id) async {
    return await _performWebRequest<GameScreenshotModal>(RequestType.get, ConfigData.gameScreenshots(id));
  }
}
