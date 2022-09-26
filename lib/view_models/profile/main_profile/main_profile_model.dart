import 'package:flutter/cupertino.dart';
import 'package:play_hq/helpers/app_loading.dart';
import 'package:play_hq/models/common_models/game_preferences/response_body.dart';

import '../../../models/common_models/user/user_details.dart';

abstract class MainProfileModel extends ChangeNotifier with AppLoader {
  void getProfileDetails();

  List<Data> get wishlistGames;
  List<Data> get libraryGames;

  UserDetails get userDetails;

  ProfilePageViewTab get currentPageViewTab;

  set currentPageViewTab(ProfilePageViewTab index);
}

enum ProfilePageViewTab { WISHLIST_TAB, LIBRARY_TAB }
