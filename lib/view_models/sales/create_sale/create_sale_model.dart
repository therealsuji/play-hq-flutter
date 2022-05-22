import 'package:flutter/cupertino.dart';
import '../../../models/sales/sales_payload_model.dart';

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
