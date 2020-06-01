import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:play_hq/constants/token.dart';
import 'package:play_hq/helpers/secure_storage.dart';

class NetworkClient {
  //singleton  class
  static final NetworkClient _instance = NetworkClient._internal();

  factory NetworkClient() {
    return _instance;
  }

  static final dio = new Dio();

  NetworkClient._internal() {
    dio.options.baseUrl = 'http://192.168.1.2:3000';
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 5000;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      var accessToken = await SecureStorage.readValue(ACCESS_TOKEN);
      if (accessToken != null) {
        options.headers["Authorization"] = "Bearer " + accessToken;
      }
      return options; //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `_dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `_dioError` object or return `_dio.reject(errMsg)`
    }, onResponse: (Response response) async {
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) async {
      //Do something with response error
      if (e.response != null) {
        switch (e.response.statusCode) {
          case 401:
            throw Exception('Unauthorized');
            break;
          case 404:
            throw Exception('Not Found Exception');
            break;
          case 400:
            throw Exception('Not Found Exception');
            break;
          case 500:
            throw Exception('Not Found Exception');
            break;
        }
      }
      return e; //continue
    }));
  }
}
