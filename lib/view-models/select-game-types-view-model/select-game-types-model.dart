

import 'package:flutter/cupertino.dart';

abstract class SelectGameTypesModel with ChangeNotifier{

  bool get currentState;

  void changeState(bool state);

}