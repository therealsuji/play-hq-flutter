import 'package:play_hq/models/common_models/page_model.dart';
import 'package:play_hq/models/common_models/user/user_details.dart';

abstract class FriendsRepository {
  Future<PagedResult<UserDetails>> search(String query, int page);
}
