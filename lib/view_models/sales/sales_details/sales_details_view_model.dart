import 'package:flutter/cupertino.dart';

abstract class SalesDetailsViewModel with ChangeNotifier {

  void makePurchaseRequest(String saleId);

  void getPrice(String price);

}