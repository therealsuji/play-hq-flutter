


import 'package:play_hq/view-models/custom-sale/custom-search-model.dart';

class ImplCustomSearch extends CustomSearchModel{

  bool _isclicked = false;

  @override
  void onClicked(bool click) {
    _isclicked = click;
    notifyListeners();
  }

  @override
  bool get isCLicked => _isclicked;



}