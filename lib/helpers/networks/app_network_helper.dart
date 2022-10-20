import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/networks/app_network.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/base_managers/error.dart';

class NetworkResult<T> {
  dynamic rawResult;
  Future<T> result;
  NetworkResult(this.rawResult, this.result);
}

class NetworkHelper {
  final _httpClient = locator<Network>();

  Future<NetworkResult<T>> get<T>(String url, computeCallback) async {
    try {
      var response = await _httpClient.performRequest(url, HttpAction.GET);
      return NetworkResult(response.body, compute(computeCallback, response.body));
    } on TimeoutException {
      locator<ErrorManager>().showError(TimeoutFailure());
      throw TimeoutFailure();
    } on SocketException {
      locator<ErrorManager>().showError(NetworkFailure());
      throw NetworkFailure();
    } catch (e) {
      locator<ErrorManager>().showError(UnknownFailure());
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
      locator<ErrorManager>().showError(TimeoutFailure());
      throw TimeoutFailure();
    } on SocketException {
      locator<ErrorManager>().showError(NetworkFailure());
      throw NetworkFailure();
    } catch (e) {
      locator<ErrorManager>().showError(UnknownFailure());
      throw UnknownFailure(
        message: e.toString(),
      );
    }
  }
}