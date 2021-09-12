import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/view-models/custom-search/custom-search-model.dart';
import 'package:play_hq/view-models/onboarding/setup-purchase-account-view-model/purchase-account-model.dart';
import 'package:play_hq/view-models/search-game/search-game-view-model.dart';
import 'package:play_hq/widgets/custom-loading-barrier-widget.dart';
import 'package:play_hq/widgets/custom-search-item-widget.dart';
import 'package:provider/provider.dart';

class ClickedSearch extends StatefulWidget {

  final SearchGameScreens? values;

  ClickedSearch({this.values});

  @override
  _ClickedSearchState createState() => _ClickedSearchState();
}

class _ClickedSearchState extends State<ClickedSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40) , left: 24 , right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _customSearchTextfield(true),
          Container(
            height: 1.5,
            width: ScreenUtils.bodyWidth,
            decoration: BoxDecoration(
              gradient: PRIMARY_GRADIENT,
              borderRadius: BorderRadius.circular(5.0)
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15 , bottom: 15),
            height: ScreenUtils.getDesignHeight(125),
            width: ScreenUtils.bodyWidth,
            color: Colors.red,
          ),
          Container(
            height: 1.5,
            width: ScreenUtils.bodyWidth,
            decoration: BoxDecoration(
                gradient: PRIMARY_GRADIENT,
                borderRadius: BorderRadius.circular(5.0)
            ),
          ),
          Consumer<CustomSearchModel>(
            builder: (_, val, __) {
              switch (val.states) {
                case SearchScreenStates.EMPTY:
                  return Container();
                  break;
                case SearchScreenStates.LOADING:
                  return CustomLoadingBarrier(path: 'assets/animations/search.json');
                  break;
                case SearchScreenStates.SUCCESS:
                  return Expanded(
                    child: ListView.builder(
                        itemCount: val.gameList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              switch (widget.values) {
                                case SearchGameScreens.SetupPurchase:
                                  var game = val.gameList[index];
                                  Navigator.pop(context, game);
                                  break;
                                case SearchGameScreens.SetupSales:
                                  break;
                                case SearchGameScreens.CreateSales:
                                  break;
                                default:
                                  print('Something went wrong');
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
                  break;
                case SearchScreenStates.FAILED:
                  return CustomLoadingBarrier(
                    path: 'assets/animations/error.json',
                  );
                  break;
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
        onChanged: (val) =>
            Provider.of<CustomSearchModel>(context, listen: false)
                .searchGames(val),
        cursorColor: PRIMARY_COLOR,
        decoration: InputDecoration(
          prefixIcon: Container(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: GestureDetector(
              onTap: () =>  Provider.of<CustomSearchModel>(context, listen: false).onClicked(false),
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