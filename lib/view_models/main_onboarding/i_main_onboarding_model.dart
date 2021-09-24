

import 'package:play_hq/view_models/main_onboarding/main_onboarding_model.dart';

class IMainOnbooardingModel extends MainOnboardingModel {

  int _currentPage = 0;

  @override
  // TODO: implement currentPage
  int get currentPage => _currentPage;

  @override
  void nextPage() {
    if(_currentPage >= 0 && _currentPage < 3) {
      _currentPage++;
      notifyListeners();
    }
  }

  @override
  void previousPage() {
    if(_currentPage > 0 && _currentPage < 5) {
      _currentPage--;
      notifyListeners();
    }
  }
}