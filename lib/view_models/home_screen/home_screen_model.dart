import 'package:flutter/foundation.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';

abstract class HomeScreenModel extends ChangeNotifier {

  void onCarouselPageChanged(int index);

  int get carouselPageIndex;

  void loadAPICalls();

  List<SalesPayload> get wishListGames;

  List<SalesPayload> get soloGames;
}
