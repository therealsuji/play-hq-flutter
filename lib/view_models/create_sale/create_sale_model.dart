import 'package:flutter/cupertino.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/models/create_sale_model.dart';

abstract class CreateSaleModel with ChangeNotifier {
  double get price;

  bool get isNegotiable;

  String get remarks;

  bool get isFormValid;

  void validateForm();

  void setPrice(double value);

  void setIsNegotiable(bool value);

  dynamic get selectedGame;

  void setSelectedGame(dynamic value);

  void setRemarks(String value);

  List<SaleGame> get gameList;

  void updateGame(int id);

  void addGame(int id, String name, String image);

  void removeGame(int id);

  void createSale();

  dynamic get selectedPlatform;

  void setSelectedPlatform(dynamic id);

  GameCondition? get selectedGameCondition;

  void setSelectedGameCondition(GameCondition condition);

  bool get sheetSaved;

  void setSheetSaved(bool isSaved);

  bool get platformIsExpanded;

  void setPlatformIsExpanded(bool expanded);

  Set<Map<String, dynamic>> get consoleList;
}
