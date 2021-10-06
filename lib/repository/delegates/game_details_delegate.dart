import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/foundation.dart';

import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/models/errors/exceptions.dart';
import 'package:play_hq/models/game_details_models/game_details_model.dart' as details;
import 'package:play_hq/models/game_details_models/game_screenshot_modal.dart' as sc;
import 'package:play_hq/models/game_details_models/get_game_details.dart';
import 'package:play_hq/repository/clients/game_details_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/base_managers/error.dart';

class GameDetailsDelegate extends GameDetailsRepository {

  Map<String, String> _headers = {
    "User-Agent": 'PlayHQ',
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNjMzMjkyNDUyLCJleHAiOjE2MzU4ODQ0NTJ9.CzwaKpZF2M_YZmgOOGHTY0WGgEGP0F329narI0hjXDY'
  };

  @override
  Future<GetGameDetails?> getGameDetails(int id) async {
    var client = Client();
    
    try{
      var detailsResponse = await client.get(Uri.parse(APIConfig.gameDetails(id)));
      var screenshotsResponse = await client.get(Uri.parse(APIConfig.gameScreenshots(id)));

      var gameDetails = await compute(details.gameDetailsModelFromJson, detailsResponse.body);
      var screenshots = await compute(sc.gameScreenshotModalFromJson, screenshotsResponse.body);

      return GetGameDetails(
        gameDetails: gameDetails,
        gameScreenshots: screenshots,
      );
    }
    on TimeoutException {
      locator<ErrorManager>().setError(PlayHQTimeoutException());
      return null;
    }
    on SocketException {
      locator<ErrorManager>().setError(PlayHQSocketException());
      return null;
    }
    catch(e){
      locator<ErrorManager>().setError(PlayHQGeneralException(
        errorText: e.toString(),
      ));
      return null;
    }
    finally{
      client.close();
    }
  }

  @override
  Future<void> setGameLibrary(Map<String, dynamic> body) async {
    var client = Client();

    try{
      Response response = await client.post(Uri.parse(APIConfig.addToLibrary), body: json.encoder.convert(body), headers: _headers);
      print("Response: ${response.body}");
    }
    on TimeoutException {
      locator<ErrorManager>().setError(PlayHQTimeoutException());
    }
    on SocketException {
      locator<ErrorManager>().setError(PlayHQSocketException());
    }
    catch(e){
      locator<ErrorManager>().setError(PlayHQGeneralException(
        errorText: e.toString(),
      ));
    }
    finally{
      client.close();
    }
  }

  @override
  Future<void> setGameWishList(Map<String, dynamic> body) async {
    var client = Client();

    try{
      Response response = await client.post(Uri.parse(APIConfig.addToWishList), body: json.encoder.convert(body), headers: _headers);
      print("Response: ${response.body}");
    }
    on TimeoutException {
      locator<ErrorManager>().setError(PlayHQTimeoutException());
    }
    on SocketException {
      locator<ErrorManager>().setError(PlayHQSocketException());
    }
    catch(e){
      locator<ErrorManager>().setError(PlayHQGeneralException(
        errorText: e.toString(),
      ));
    }
    finally{
      client.close();
    }
  }
}