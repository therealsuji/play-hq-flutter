

import 'package:flutter/material.dart';
import 'package:play_hq/models/sales/sales_model.dart';

abstract class MySalesViewModel with ChangeNotifier {

  List<SalesPayload> get fetchActiveSales;

  void fetchAllSales();

}