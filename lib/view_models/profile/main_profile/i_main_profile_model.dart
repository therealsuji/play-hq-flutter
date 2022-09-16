import 'package:event_bus/event_bus.dart';
import 'package:play_hq/models/common_models/game_preferences/response_body.dart';
import 'package:play_hq/models/common_models/user/user_details.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/repository/clients/main_profile_screen_repository.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/view_models/profile/main_profile/main_profile_model.dart';

class IMainProfileModel extends MainProfileModel {
  final _eventBus = locator<EventBus>();
  final _mainProfileAPI = locator<MainProfileScreenRepository>();

  List<Data> _wishlistGames = [];
  List<Data> _libraryGames = [];
  late UserDetails _userDetails = UserDetails(displayName: "", firstName: "", lastName: "", avatar: "");
  ProfilePageViewTab _pageViewTab = ProfilePageViewTab.WISHLIST_TAB;

  @override
  void getProfileDetails() async {
    try {
      _eventBus.fire(LoadingEvent.show());

      await _mainProfileAPI.getWishListGames().then((value) {
        if (value.data.isNotEmpty) {
          _wishlistGames = value.data;
        }
      });
      await _mainProfileAPI.getUserDetails().then((value) => _userDetails = value);
      print("User Avatar: ${_userDetails.avatar}");
      await _mainProfileAPI.getLibraryGames().then((value) {
        if (value.data.isNotEmpty) {
          _libraryGames = value.data;
        }
        _eventBus.fire(LoadingEvent.hide());
      });
      notifyListeners();
    } catch (e) {
      print("Exception is here {$e}");
      _eventBus.fire(LoadingEvent.hide());
    }
  }

  @override
  List<Data> get wishlistGames => _wishlistGames;

  @override
  List<Data> get libraryGames => _libraryGames;

  @override
  // TODO: implement userDetails
  UserDetails get userDetails => _userDetails;

  @override
  ProfilePageViewTab get currentPageViewTab => _pageViewTab;

  set currentPageViewTab(ProfilePageViewTab index) {
    _pageViewTab = index;
    notifyListeners();
  }
}
