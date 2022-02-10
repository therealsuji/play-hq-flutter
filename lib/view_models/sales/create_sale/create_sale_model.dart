import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/common_models/game_preferance_model.dart';

abstract class CreateSaleModel with ChangeNotifier {
  double get price;

  bool get isNegotiable;

  String get remarks;

  bool get isFormValid;

  int get platformId;

  String get currentCondition;

  void validateForm();

  void setPrice(double value);

  void setIsNegotiable(bool value);

  void setRemarks(String value);

  List<GamePreferances> get selectedGameList;

  void addSelectedGame(GamePreferances game);

  int get selectedPlatform;

  void setSelectedPlatform(int selecttedId , int platformId);

  void createSale();

  void removeGame(int id);

  void updateGame(int id);

  void getCurrentCondition(int id);

  void changeCurrentCondition(String condition);

}
