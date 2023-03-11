import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/screens/custom_search_screen/search_screen.dart';
import 'package:play_hq/view_models/custom_search/friends_search_model.dart';
import 'package:play_hq/view_models/custom_search/searchable_model.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class FriendsSearchScreen extends StatelessWidget {
  const FriendsSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: BACKGROUND_COLOR,
        child: ChangeNotifierProvider.value(
          value: context.read<FriendsSearchModel>() as SearchableModel,
          child: SearchScreen(
            onBackClick: () => Navigator.pop(context),
            listView: Consumer<FriendsSearchModel>(
              builder: (_, vm, __) {
                return ListView.separated(
                  separatorBuilder: (context, index) => Container(
                    height: 20,
                  ),
                  itemCount: vm.searchList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, USER_PROFILE_SCREEN, arguments: vm.searchList[index].email),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(color: UNSELECTED_COLOR, borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Image.asset(
                            SMILE_EMOJI,
                            height: ScreenUtils.getDesignHeight(25.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CustomTextWidget(
                              vm.searchList[index].displayName ?? "",
                              style: Theme.of(context).primaryTextTheme.bodyLarge,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
