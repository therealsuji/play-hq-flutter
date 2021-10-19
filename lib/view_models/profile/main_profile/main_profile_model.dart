


import 'package:flutter/cupertino.dart';

abstract class MainProfileModel with ChangeNotifier {

  ScrollController get scroller;

  double get height;

  double get width;

  void scrollListner();

}