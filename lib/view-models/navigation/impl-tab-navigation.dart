import 'package:play_hq/view-models/navigation/tab-navigation-model.dart';

class ImplTabNavigation extends TabNavigationModel {
  var _currentPage = 0;

  @override
  void changeTab(int tabNumber) {
    if (_currentPage == 2){
      return;
    }
    _currentPage = tabNumber;
    notifyListeners();
  }

  @override
  int get currentPage => _currentPage;

}