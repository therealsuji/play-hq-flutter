import 'package:flutter/material.dart';

abstract class TabNavigationModel with ChangeNotifier {

  int get currentPage ;

  void changeTab(int tabNumber);
}