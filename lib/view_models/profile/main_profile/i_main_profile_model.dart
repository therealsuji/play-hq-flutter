import 'dart:convert';

import 'package:play_hq/repository/clients/user_repository.dart';

import '../../../helpers/app_secure_storage.dart';
import '../../../models/common_models/game_preferences/response_body.dart';
import '../../../models/common_models/user/user_details.dart';
import '../../../repository/clients/main_profile_screen_repository.dart';
import '../../../injection_container.dart';
import '../../../services/auth_service.dart';
import 'main_profile_model.dart';

class IMainProfileModel extends MainProfileModel {
  final _mainProfileAPI = sl<MainProfileScreenRepository>();
  final _userApi = sl<UserRepository>();

  List<Data> _wishlistGames = [];
  List<Data> _libraryGames = [];
  late UserDetails _userDetails = UserDetails(displayName: "", name: "", avatar: "");
  ProfilePageViewTab _pageViewTab = ProfilePageViewTab.WISHLIST_TAB;

  @override
  void getProfileDetails() async {
    try {
      this.loadingData();
      _wishlistGames = await _userApi.getWishlistGames();
      _libraryGames = await _userApi.getLibraryGames();
      _userDetails = await _userApi.getUserDetails();
      dataLoaded();
      notifyListeners();
    } catch (e) {
      print("Exception is here {$e}");
      hideLoader();
    }
  }

  void getUserDetails() async {
    _wishlistGames = await _userApi.getWishlistGames();
    _libraryGames = await _userApi.getLibraryGames();
    _userDetails = await _userApi.getUserDetails();
    notifyListeners();
  }

  set currentPageViewTab(ProfilePageViewTab index) {
    _pageViewTab = index;
    notifyListeners();
  }

  @override
  List<Data> get wishlistGames => _wishlistGames;

  @override
  List<Data> get libraryGames => _libraryGames;

  @override
  UserDetails get userDetails => _userDetails;

  @override
  ProfilePageViewTab get currentPageViewTab => _pageViewTab;
}
