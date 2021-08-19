

import 'package:flutter/cupertino.dart';

abstract class CustomSearchModel with ChangeNotifier{

  bool get isCLicked;

  void onClicked(bool click);

}