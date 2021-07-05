import 'package:flutter/foundation.dart';

abstract class TabNavigationModel with ChangeNotifier {
  int get currentPage ;
  void changeTab(int tabNumber);
}