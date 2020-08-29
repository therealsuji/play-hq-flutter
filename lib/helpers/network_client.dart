import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:play_hq/constants/token.dart';
import 'package:play_hq/helpers/secure_storage.dart';
import 'package:play_hq/models/user_model.dart';

class NetworkClient {
  //singleton  class
  static final NetworkClient _instance = NetworkClient._internal();

  factory NetworkClient() {
    return _instance;
  }
  static final rawgDio = new Dio();
  static final dio = new Dio(); // this is used for app requests
  static final tokenDio = new Dio(); // this is used only for token refreshing

  NetworkClient._internal() {
    dio.options.baseUrl = 'http://192.168.1.7:3000/';
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 5000;
    tokenDio.options = dio.options;
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
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
      return response; // continue
    }, onError: (DioError e) async {
      //Do something with response error
      if (e.response != null) {
        switch (e.response.statusCode) {
          case 401:
            String accessToken = await SecureStorage.readValue(ACCESS_TOKEN);
            if (accessToken==null) {
                 throw Exception('Not Found Exception');
            }
            dio.lock();
            dio.interceptors.responseLock.lock();
            dio.interceptors.errorLock.lock(); // lock dio to enqueue all requests
            RequestOptions options = e.response.request;
            var refreshToken = await SecureStorage.readValue(REFRESH_TOKEN);
            //get new refresh and access token
            var res = await tokenDio.post("/auth/getRefreshToken", data: {"refreshToken": refreshToken});
            var tokens = Auth.fromJson(res.data);
            await SecureStorage.writeValue(ACCESS_TOKEN, tokens.accessToken);
            await SecureStorage.writeValue(REFRESH_TOKEN, tokens.refreshToken);
            // add new access token to current 401 request
            options.headers["Authorization"] = "Bearer " + tokens.accessToken;
            dio.unlock();
            dio.interceptors.responseLock.unlock();
            dio.interceptors.errorLock.unlock(); // unlock dio and return previous request
            return dio.request(options.path, options: options);
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
