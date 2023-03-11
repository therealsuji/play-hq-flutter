import 'dart:convert';

import 'package:play_hq/repository/clients/user_repository.dart';

import '../../../helpers/app_secure_storage.dart';
import 'package:play_hq/services/auth_service.dart';
import '../../../models/common_models/game_preferences/response_body.dart';
import '../../../models/common_models/user/user_details.dart';
import '../../../injection_container.dart';
import 'main_profile_model.dart';

class IMainProfileModel extends MainProfileModel {
  final _userApi = sl<UserRepository>();

  List<Data> _wishlistGames = [];
  List<Data> _libraryGames = [];
  late UserDetails _userDetails = UserDetails(displayName: "", name: "", avatar: "");
  ProfilePageViewTab _pageViewTab = ProfilePageViewTab.WISHLIST_TAB;

  @override
  void getProfileDetails(String? email) async {
    try {
      this.loadingData();

      if (email != null) {
        _wishlistGames = await _userApi.getWishlistGamesFromUserEmail(email).then((value) => value.data);
        _libraryGames = await _userApi.getLibraryGamesFromUserEmail(email).then((value) => value.data);
        _userDetails = await _userApi.getUserDetailsFromEmail(email);
      } else {
        _wishlistGames = await sl<AuthService>().getWishlistGames();
        _libraryGames = await sl<AuthService>().getLibraryGames();
        _userDetails = await sl<AuthService>().getUserDetails();
      }

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
