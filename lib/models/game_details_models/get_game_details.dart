import 'package:play_hq/models/game_details_models/game_details_model.dart';
import 'package:play_hq/models/game_details_models/game_screenshot_modal.dart';

class GetGameDetails {
  final GameDetailModel? gameDetails;

  final GameScreenshotModal? gameScreenshots;

  const GetGameDetails({this.gameDetails, this.gameScreenshots});
}
