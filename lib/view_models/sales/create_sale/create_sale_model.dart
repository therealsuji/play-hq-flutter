import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/common_models/game_preferance_models.dart';

abstract class CreateSaleModel with ChangeNotifier {
  double get price;

  bool get isNegotiable;

  String get remarks;

  bool get isFormValid;

  int get platformId;

  String get currentCondition;

  bool get isAdded;

  void validateForm();

  void setPrice(double value);

  void setIsNegotiable(bool value);

  void setRemarks(String value);

  List<FakePreferances> get selectedGameList;

  void addSelectedGame(FakePreferances game);

  void checkGame(FakePreferances gameDetails);

  int get selectedPlatform;

  void setSelectedPlatform(int selectedId , int platformId);

  void createSale();

  void removeGame(int id);

  void updateGame(int id);

  void changeCurrentCondition(String condition);

}
