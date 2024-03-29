import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/common_models/game_preferance_models.dart';
import 'package:play_hq/models/game_details_models/game_details_arguments.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/custom_search/custom_search_model.dart';
import 'package:play_hq/view_models/onboarding/setup_purchase_account_view_model/purchase_account_model.dart';
import 'package:play_hq/view_models/sales/create_sale/create_sale_model.dart';
import 'package:play_hq/view_models/view_models.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_loading_barrier_widget.dart';
import 'package:play_hq/widgets/custom_search_item_widget.dart';
import 'package:play_hq/widgets/custom_selecting_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

import '../../../service_locator.dart';

class ClickedSearch extends StatefulWidget {
  final SearchType? values;

  ClickedSearch({this.values});

  @override
  _ClickedSearchState createState() => _ClickedSearchState();
}

class _ClickedSearchState extends State<ClickedSearch> {
  @override
  Widget build(BuildContext context) {
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
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return _platformBottomSheet(
                                            index, false);
                                      });
                                  break;
                                case SearchType.MAIN_SEARCH:
                                  locator<NavigationService>().pushNamed(GAME_DETAILS_SCREEN , args: GameDetailsArguments(gameId: val.gameList[index].id));
                                  break;
                                case SearchType.SETUP_PURCHASES:
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return _platformBottomSheet(
                                            index, true);
                                      });
                                  break;
                                case SearchType.SETUP_SALES:
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return _platformBottomSheet(
                                            index, true);
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

  Widget _platformBottomSheet(int index, bool isPLatform) {
    return ChangeNotifierProvider.value(
      value: Provider.of<CustomSearchModel>(context),
      child: Consumer<CustomSearchModel>(
        builder: (_, val, __) {
          return Container(
            width: ScreenUtils.bodyWidth,
            height: ScreenUtils.getDesignHeight(300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: POPUP_COLOR,
            ),
            child: Container(
              margin: EdgeInsets.only(
                  top: ScreenUtils.getDesignHeight(30),
                  left: ScreenUtils.getDesignWidth(24),
                  right: ScreenUtils.getDesignWidth(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    'Select Platform',
                    isDynamic: false,
                    width: ScreenUtils.getDesignWidth(100),
                    style: Theme.of(context).primaryTextTheme.headline3,
                  ),
                  Container(
                      margin:
                          EdgeInsets.only(top: ScreenUtils.getDesignHeight(20)),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 15.0,
                          crossAxisSpacing: 15.0,
                          mainAxisExtent: ScreenUtils.getDesignHeight(45.0),
                        ),
                        itemCount: isPLatform
                            ? platforms.length
                            : game_conditions.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                isPLatform
                                    ? Provider.of<CustomSearchModel>(context,
                                            listen: false).addPlatform(
                                            platforms.indexOf(platforms[index]),
                                            platforms[index]['id'])
                                    : Provider.of<CustomSearchModel>(context,
                                            listen: false)
                                        .addGameCondition(
                                            game_conditions.indexOf(
                                                game_conditions[index]),
                                            game_conditions[index]
                                                ['API_Slug']!);
                              },
                              child: CustomSelectingWidget(
                                titleText: isPLatform
                                    ? platforms[index]['name']
                                    : game_conditions[index]['name'],
                                active: isPLatform
                                    ? platforms.indexOf(platforms[index]) ==
                                            val.selectedPlatform
                                        ? true
                                        : false
                                    : game_conditions.indexOf(
                                                game_conditions[index]) ==
                                            val.selectedGameCondition
                                        ? true
                                        : false,
                              ));
                        },
                      )),
                  Container(
                      margin:
                          EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
                      child: Consumer<CustomSearchModel>(
                        builder: (_, val, __) {
                          return CustomButton(
                            buttonText: 'Confirm Game',
                            gradient: GREEN_GRADIENT,
                            onPressed: () {
                              Navigator.pop(context);
                              if(widget.values == SearchType.CREATE_SALE){
                                Provider.of<CustomSearchModel>(context, listen: false).addGameToSale(index);
                              }else{
                                Provider.of<CustomSearchModel>(context, listen: false).addGameToList(index);
                              }
                              // GamePreferances game = val.gameDetails;
                              // isPLatform ? widget.values == SearchType.SETUP_PURCHASES ? Navigator.pushNamed(context, SETUP_PURCHASE_ACCOUNT_ROUTE) : Navigator.pushNamed(context, SETUP_SALES_ACCOUNT_ROUTE) : Navigator.pushNamed(context, CREATE_SALE_ROUTE , arguments: game);
                            },
                          );
                        },
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  GameModel addGamesToModel(GameDetails gameDetails) {
    List<int>? platformID = [];
    List<int>? genreID = [];
    gameDetails.platforms!.length > 0
        ? gameDetails.platforms!.forEach((element) {
            platformID!.add(element.platform!.id!);
          })
        : platformID = [];
    gameDetails.genres!.length > 0
        ? gameDetails.genres!.forEach((element) {
            platformID!.add(element.id);
          })
        : genreID = [];
    GameModel gameItem = GameModel(
        title: gameDetails.name,
        releaseDate: gameDetails.released,
        apiId: gameDetails.id,
        boxCover: gameDetails.image,
        genres: genreID,
        backgroundImage: gameDetails.image,
        platforms: platformID);
    return gameItem;
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
