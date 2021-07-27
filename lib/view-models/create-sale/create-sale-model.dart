import 'package:flutter/cupertino.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/models/create-sale-model.dart';

abstract class CreateSaleModel with ChangeNotifier {
  List<SaleGame> get gameList;

  void addGame(int? id, String? name, String? image);

  void removeGame(int id);

  Future<bool> createSale();

  dynamic get selectedPlatform;

  void setSelectedPlatform(dynamic id);

  GameCondition? get selectedGameCondition;

  void setSelectedGameCondition(GameCondition? condition);

  bool get sheetSaved;

  void setSheetSaved(bool isSaved);

  bool get platformIsExpanded;

  void setPlatformIsExpanded(bool expanded);

  Set<Map<String, dynamic>> get consoleList;
}
