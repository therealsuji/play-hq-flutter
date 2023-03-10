import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../models/errors/exceptions.dart';
import '../../injection_container.dart';
import '../../services/base_managers/error_manager.dart';
import '../app_enums.dart';
import 'app_network.dart';

class NetworkResult<T> {
  Response rawResult;
  Future<T> result;
  NetworkResult(this.rawResult, this.result);
}

class NetworkHelper {
  final _httpClient = sl<Network>();
  

  Future<NetworkResult<T>> fetchAll<T>(String url, computeCallback) async {
    try {
      Response response = await _httpClient.performRequest(url, HttpAction.GET);
      return NetworkResult(response, compute(computeCallback, response.body));
    } on TimeoutException {
      sl<ErrorManager>().showError(TimeoutFailure());
      throw TimeoutFailure();
    } on SocketException {
      sl<ErrorManager>().showError(NetworkFailure());
      throw NetworkFailure();
    } catch (e) {
      sl<ErrorManager>().showError(UnknownFailure());
      throw UnknownFailure(
        message: e.toString(),
      );
    }
  }

  Future<bool> post<T>(String url, dynamic body) async {
    try {
      Response response = await _httpClient.performRequest(url, HttpAction.POST, body: body);
      if(response.statusCode >= 200 && response.statusCode < 300){
        return true;
      }else{
        return false;
      }
    } on TimeoutException {
      sl<ErrorManager>().showError(TimeoutFailure());
      throw TimeoutFailure();
    } on SocketException {
      sl<ErrorManager>().showError(NetworkFailure());
      throw NetworkFailure();
    } catch (e) {
      sl<ErrorManager>().showError(UnknownFailure());
      throw UnknownFailure(
        message: e.toString(),
      );
    }
  }

  Future<NetworkResult<T>> put<T>(String url, Map<String, dynamic> body, computeCallback) async {
    try {
      Response response = await _httpClient.performRequest(url, HttpAction.PUT, body: body);
      return NetworkResult(response, compute(computeCallback, response.body));
    } on TimeoutException {
      sl<ErrorManager>().showError(TimeoutFailure());
      throw TimeoutFailure();
    } on SocketException {
      sl<ErrorManager>().showError(NetworkFailure());
      throw NetworkFailure();
    } catch (e) {
      sl<ErrorManager>().showError(UnknownFailure());
      throw UnknownFailure(
        message: e.toString(),
      );
    }
  }
}
