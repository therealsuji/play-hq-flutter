

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/page_view.dart';
import 'package:play_hq/view_models/main_onboarding/main_onboarding_model.dart';

class IMainOnbooardingModel extends MainOnboardingModel {

  int _currentPage = 0;
  PageController _controller = PageController(initialPage: 0 , keepPage: true);

  @override
  int get currentPage => _currentPage;

  @override
  void nextPage() {
    if(_currentPage >= 0 && _currentPage < 3) {
      _currentPage++;
      _controller.animateToPage(_currentPage++, duration: Duration(milliseconds: 500), curve: Curves.ease);
      notifyListeners();
    }
  }

  @override
  void previousPage() {
    if(_currentPage > 0 && _currentPage < 5) {
      _currentPage--;
      _controller.animateToPage(_currentPage--, duration: Duration(milliseconds: 500), curve: Curves.ease);
      notifyListeners();
    }
  }

  @override
  void changePage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  @override
  PageController get pageController => _controller;
}