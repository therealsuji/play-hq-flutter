

import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:play_hq/view_models/profile/main_profile/main_profile_model.dart';

class IMainProfileModel extends MainProfileModel {

  ScrollController? _sliderController;

  double _height = 200;
  double _width = 100;


  @override
  // TODO: implement scroller
  ScrollController get scroller => _sliderController!;

  @override
  void scrollListner() {
    _height = 50;
    _width = 25;
    notifyListeners();
  }


  @override
  // TODO: implement height
  double get height => _height;

  @override
  // TODO: implement width
  double get width => _width;


}