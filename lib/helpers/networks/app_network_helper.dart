import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart';
import 'package:http_extensions_cache/http_extensions_cache.dart';

import '../../models/errors/exceptions.dart';
import '../../injection_container.dart';
import '../../services/base_managers/error_manager.dart';
import '../app_enums.dart';
import 'app_cache_manager.dart';
import 'app_network.dart';

class RawgResult{
  int gamesCount;
  Response response;
  RawgResult(this.gamesCount , this.response);
}

class NetworkResult<T> {
  dynamic rawResult;
  Future<T> result;

  NetworkResult(this.rawResult, this.result);
}

class CachedResponse {
  final Response response;
  final DateTime expiry;

  CachedResponse(this.response, this.expiry);
}

class NetworkHelper {
  final _httpClient = sl<Network>();

  Future<NetworkResult<T>> fetchAll<T>(String url, computeCallback , bool cacheData) async {
    final cacheManager = CacheManager(
      Config(
        'my_cache_key',
        stalePeriod: const Duration(days: 2),
        maxNrOfCacheObjects: 100,
        repo: JsonCacheInfoRepository(databaseName: 'cache_manager'),
      ),
    );
    try {
      if(cacheData) {
        final fileInfo = await cacheManager.getFileFromCache(url);
        final file = fileInfo?.file;
        if (file != null && file.existsSync()) {
          debugPrint(
              'Data Already Saved'
          );
          final cachedData = await file.readAsString();
          return NetworkResult(
              cachedData, compute(computeCallback, cachedData));
        } else {
          Response response =
          await _httpClient.performRequest(url, HttpAction.GET);
          final responseData = response.body;
          await cacheManager.putFile(
              url, Uint8List.fromList(utf8.encode(responseData))
          );
          return NetworkResult(
              response, compute(computeCallback, response.body));
        }
      }else{
        Response response =
        await _httpClient.performRequest(url, HttpAction.GET);
        return NetworkResult(
            response, compute(computeCallback, response.body));
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

  Future<RawgResult> rawgPostCalls(String url) async {
    Response response = await _httpClient.performRequest(url, HttpAction.GET);
    final body = jsonDecode(response.body);
    final count = int.parse(body['count'].toString());
    int pages = (count/15).floor();
    return RawgResult(pages, response);
  }

  Future<bool> post<T>(String url, dynamic body) async {
    try {
      Response response =
          await _httpClient.performRequest(url, HttpAction.POST, body: body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
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

  Future<NetworkResult<T>> put<T>(
      String url, Map<String, dynamic> body, computeCallback) async {
    try {
      Response response =
          await _httpClient.performRequest(url, HttpAction.PUT, body: body);
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
