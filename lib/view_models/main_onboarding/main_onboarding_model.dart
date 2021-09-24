

import 'package:flutter/cupertino.dart';

abstract class MainOnboardingModel with ChangeNotifier{

  int get currentPage ;

  void nextPage();

  void previousPage();

}