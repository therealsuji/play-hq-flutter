import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/common_models/game_preferences/request_body.dart';
import 'package:play_hq/models/orders_model/orders.dart';

import '../../../models/sales/sales_payload_model.dart';

abstract class CreateSaleModel with ChangeNotifier {
  int get price;

  bool get isNegotiable;

  String get remarks;

  bool get isFormValid;

  int get platformId;

  String get currentCondition;

  bool get isAdded;

  void validateForm();

  void setPrice(int value);

  void setIsNegotiable(bool value);

  void setRemarks(String value);

  List<GameElement> get selectedGameList;

  void addSelectedGame(GameElement game);

  void checkGame(GameElement gameDetails);

  int get selectedPlatform;

  void setSelectedPlatform(int selectedId , int platformId);

  void createSale();

  void removeGame(int id);

  void updateGame(int id);

  int get gameCount;

  void changeCurrentCondition(String condition);

}
