

import 'package:flutter/cupertino.dart';

abstract class MainOnboardingModel with ChangeNotifier{

  int get currentPage ;

  PageController get pageController;

  void nextPage();

  void previousPage();

  void changePage(int page);

}