


import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/common_models/game_preferences/response_body.dart';

import '../../../models/common_models/user/user_details.dart';

abstract class MainProfileModel with ChangeNotifier {

  List<Data> get fetchAllWishlistGames;

  void getProfileDetails();

  List<Data> get fetchAllLibraryGames;

  UserDetails get userDetails;

}