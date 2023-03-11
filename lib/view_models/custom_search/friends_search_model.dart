import 'dart:async';

import 'package:play_hq/injection_container.dart';
import 'package:play_hq/models/common_models/user/user_details.dart';
import 'package:play_hq/repository/clients/friends_repository.dart';
import 'package:play_hq/view_models/custom_search/searchable_model.dart';

class FriendsSearchModel extends SearchableModel<UserDetails> {
  FriendsRepository _friendsRepository = sl<FriendsRepository>();

  @override
  searchApi(String query) async {
    var result = await _friendsRepository.search(query, 1);
    return result.data;
  }
}
