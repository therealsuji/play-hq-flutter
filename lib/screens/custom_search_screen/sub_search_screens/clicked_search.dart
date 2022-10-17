import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/game_details_models/game_details_arguments.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/custom_search/custom_search_model.dart';
import 'package:play_hq/view_models/view_models.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_loading_barrier_widget.dart';
import 'package:play_hq/widgets/custom_search_item_widget.dart';
import 'package:play_hq/widgets/custom_selecting_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

import '../../../service_locator.dart';
import '../../../widgets/bottomSheets/platform_sheet.dart';

class ClickedSearch extends StatefulWidget {
  final SearchType? values;

  ClickedSearch({this.values});

  @override
  _ClickedSearchState createState() => _ClickedSearchState();
}

class _ClickedSearchState extends State<ClickedSearch> {

  @override
  Widget build(BuildContext context) {

    final model = Provider.of<CustomSearchModel>(context, listen: false);

    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtils.getDesignHeight(40), left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _customSearchTextfield(true),
          Container(
            height: 1.5,
            width: ScreenUtils.bodyWidth,
            decoration: BoxDecoration(
                gradient: PRIMARY_GRADIENT,
                borderRadius: BorderRadius.circular(5.0)),
          ),
          Consumer<CustomSearchModel>(
            builder: (_, val, __) {
              switch (val.states) {
                case SearchScreenStates.EMPTY:
                  return Container();
                case SearchScreenStates.LOADING:
                  return CustomLoadingBarrier(
                      path: 'assets/animations/search.json');
                case SearchScreenStates.SUCCESS:
                  return Expanded(
                    child: ListView.builder(
                        itemCount: val.gameList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              switch (widget.values) {
                                case SearchType.CREATE_SALE:
                                  // showModalBottomSheet(
                                  //     context: context,
                                  //     builder: (BuildContext context) {
                                  //       return _platformBottomSheet(
                                  //           index, false);
                                  //     });
                                  break;
                                case SearchType.MAIN_SEARCH:
                                  locator<NavigationService>().pushNamed(GAME_DETAILS_SCREEN , args: GameDetailsArguments(gameId: val.gameList[index].id));
                                  break;
                                case SearchType.SETUP_PURCHASES:
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                            height: ScreenUtils.getDesignHeight(340),
                                            decoration: BoxDecoration(
                                                color: POP_UP_CONTAINER_COLOR,
                                                borderRadius: BorderRadius.circular(15.0)),
                                            child: ChangeNotifierProvider.value(
                                                value: model,
                                                child: PlatformBottomSheet(bottomSheetType: PlatformBottomSheetType.SETUP_WISHLIST_GAMES, onPressed: () {
                                                  Navigator.of(context).pop();
                                                  model.addGameToList(index);
                                                }, platformList: val.gameList[index].platforms)));
                                      });
                                  break;
                                case SearchType.SETUP_SALES:
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                            height: ScreenUtils.getDesignHeight(340),
                                            decoration: BoxDecoration(
                                                color: POP_UP_CONTAINER_COLOR,
                                                borderRadius: BorderRadius.circular(15.0)),
                                            child: ChangeNotifierProvider.value(
                                                value: model,
                                                child: PlatformBottomSheet(bottomSheetType: PlatformBottomSheetType.SETUP_LIBRARY_GAMES, onPressed: () {
                                                  Navigator.of(context).pop();
                                                  model.addGameToList(index);
                                                }, platformList: val.gameList[index].platforms)));
                                      });
                                  break;
                                default:
                                  break;
                              }
                            },
                            child: SearchGameItem(
                              releaseDate: val.gameList[index].released,
                              title: val.gameList[index].name,
                              imageUrl: val.gameList[index].image,
                            ),
                          );
                        }),
                  );
                case SearchScreenStates.NOTHING:
                  return CustomLoadingBarrier(
                    path: 'assets/animations/search-failed.json',
                  );
                case SearchScreenStates.FAILED:
                  return CustomLoadingBarrier(
                    path: 'assets/animations/error.json',
                  );
                default:
                  return Container();
              }
            },
          )
        ],
      ),
    );
  }

  Widget _customSearchTextfield(bool active) {
    return TextFormField(
      style: TextStyle(
        color: TEXT_COLOR,
        fontSize: 18,
      ),
      obscureText: false,
      autofocus: true,
      keyboardType: TextInputType.name,
      onChanged: (val) => Provider.of<CustomSearchModel>(context, listen: false)
          .searchGames(val),
      cursorColor: PRIMARY_COLOR,
      decoration: InputDecoration(
        prefixIcon: Container(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: GestureDetector(
            onTap: () => Provider.of<CustomSearchModel>(context, listen: false)
                .onClicked(false),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: SUB_TEXT_COLOR,
            ),
          ),
        ),
        fillColor: Colors.transparent,
        filled: true,
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        hintStyle:
            TextStyle(fontSize: 16, color: SUB_TEXT_COLOR.withOpacity(0.6)),
        hintText: 'Search Here...',
        contentPadding: EdgeInsets.only(left: 12.0, top: 20, bottom: 20),
      ),
    );
  }
}
