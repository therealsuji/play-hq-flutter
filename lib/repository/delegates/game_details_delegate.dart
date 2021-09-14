import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';
import 'package:flutter/foundation.dart';

import 'package:play_hq/helpers/networks/app-config.dart';
import 'package:play_hq/models/game_details_models/game_details_model.dart' as details;
import 'package:play_hq/models/game_details_models/game_screenshot_modal.dart' as sc;
import 'package:play_hq/models/game_details_models/get_game_details.dart';
import 'package:play_hq/repository/clients/game_details_repository.dart';

class GameDetailsDelegate extends GameDetailsRepository {
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
      return null;
    }
    on SocketException {
      return null;
    }
    catch(e){
      return null;
    }
    finally{
      client.close();
    }
  }
}