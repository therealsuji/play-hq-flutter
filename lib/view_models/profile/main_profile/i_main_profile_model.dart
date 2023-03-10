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

  List<Data> _wishlistGames = [];
  List<Data> _libraryGames = [];
  late UserDetails _userDetails = UserDetails(displayName: "", name: "", avatar: "");
  ProfilePageViewTab _pageViewTab = ProfilePageViewTab.WISHLIST_TAB;

  @override
  void getProfileDetails() async {
    try {
      this.loadingData();
      _wishlistGames = await sl<AuthService>().getWishlistGames();
      _libraryGames = await sl<AuthService>().getLibraryGames();
      _userDetails = await sl<AuthService>().getUserDetails();
      print("User Avatar: ${_userDetails.avatar}");
      dataLoaded();
      notifyListeners();
    } catch (e) {
      print("Exception is here {$e}");
      hideLoader();
    }
  }

  void getUserDetails() async {
    var jsonData = await SecureStorage.readValue('userDetailsKey');
    _userDetails = UserDetails.fromJson(json.decode(jsonData!));
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
