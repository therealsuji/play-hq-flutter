import 'package:http/http.dart';
import 'package:play_hq/models/app-user-model.dart';
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
  var connectionStatus;
  var _connect = ConnectionCheck.getInstance();

  //http client
  Client client = Client();

  Map<String, String> _headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<T> _performWebRequest<T>(RequestType type, String url, {dynamic body}) async {
    //Response initialization
    Response response;

    //Get the jwtToken from secure storage and if existing, add to the header
    String bearerToken = await SecureStorage.readValue("jwtToken");

    if (bearerToken != null) {
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
    return await _performWebRequest<UserModel>(RequestType.post, ConfigData.login, body: {"token": token});
  }


}
