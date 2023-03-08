import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../models/errors/exceptions.dart';
import '../../injection_container.dart';
import '../../services/base_managers/error_manager.dart';
import '../app_enums.dart';
import 'app_network.dart';

class NetworkResult<T> {
  dynamic rawResult;
  Future<T> result;
  NetworkResult(this.rawResult, this.result);
}

class NetworkHelper {
  final _httpClient = sl<Network>();

  Future<NetworkResult<T>> get<T>(String url, computeCallback) async {
    try {
      var response = await _httpClient.performRequest(url, HttpAction.GET);
      return NetworkResult(response.body, compute(computeCallback, response.body));
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

  Future<NetworkResult<T>> post<T>(String url, Map<String, dynamic> body, computeCallback) async {
    try {
      var response = await _httpClient.performRequest(url, HttpAction.POST, body: body);
      return NetworkResult(response.body, compute(computeCallback, response.body));
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
      var response = await _httpClient.performRequest(url, HttpAction.PUT, body: body);
      return NetworkResult(response.body, compute(computeCallback, response.body));
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
