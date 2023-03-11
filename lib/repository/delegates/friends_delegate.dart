import 'package:play_hq/helpers/networks/app_config.dart';
import 'package:play_hq/helpers/networks/app_network_helper.dart';
import 'package:play_hq/models/common_models/user/user_details.dart';
import 'package:play_hq/models/common_models/page_model.dart';
import 'package:play_hq/repository/clients/friends_repository.dart';

class FriendsDelegate extends FriendsRepository with NetworkHelper {
  @override
  Future<PagedResult<UserDetails>> search(String query, int page) async {
    var res = await fetchAll<List<UserDetails>>(APIConfig.searchFriends(query, page), listUserDetailsFromJson);
    var result = await res.result;
    return PagedResult<UserDetails>(result, res.rawResult.body).getResult();
  }
}
