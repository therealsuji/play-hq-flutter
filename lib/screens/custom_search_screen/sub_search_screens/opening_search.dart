import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/view_models/custom_search/custom_search_model.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class OpeningSearch extends StatefulWidget {
  @override
  _OpeningSearchState createState() => _OpeningSearchState();
}

class _OpeningSearchState extends State<OpeningSearch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.only(
          top: ScreenUtils.getDesignHeight(40), left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: CustomTextWidget(
                isDynamic: false,
            height: ScreenUtils.getDesignHeight(30),
            width: ScreenUtils.getDesignWidth(80),
            style: Theme.of(context)
                .primaryTextTheme
                .headline1
                ?.copyWith(fontFamily: Neusa),
            text: 'Search',
          )),
          Container(
              margin: EdgeInsets.only(top: 25),
              child: _customSearchContainer(true)),
          Container(
            margin: EdgeInsets.only(
              top: ScreenUtils.getDesignHeight(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  isDynamic: false,
                  height: ScreenUtils.getDesignHeight(30),
                  width: ScreenUtils.getDesignWidth(80),
                  style: Theme.of(context).primaryTextTheme.headline3,
                  text: 'Most Recent',
                ),
                Spacer(),
                CustomTextWidget(
                  isDynamic: false,
                    text: 'Clear All',
                    height: ScreenUtils.getDesignHeight(13),
                    style: TextStyle(
                        fontFamily: CircularBold,
                        foreground: Paint()
                          ..shader = PRIMARY_GRADIENT_TEXT_COLOR,
                        fontSize: 10)),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _customSearchContainer(bool active) {
    return GestureDetector(
      onTap: () {
        Provider.of<CustomSearchModel>(context, listen: false).onClicked(true);
      },
      child: Container(
        decoration: BoxDecoration(
          color: MAIN_CONTAINER_COLOR.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          width: ScreenUtils.bodyWidth,
          margin: EdgeInsets.symmetric(horizontal: 15 , vertical: 18),
          child: Row(
            children: [
              Icon(Icons.search , color: SUB_TEXT_COLOR,),
              Container(
                  margin: EdgeInsets.only(left: 15),
                  child: CustomTextWidget(isDynamic: false , height: ScreenUtils.getDesignHeight(16), width: ScreenUtils.getDesignWidth(85),style: TextStyle(color: SUB_TEXT_COLOR.withOpacity(0.6) , fontSize: 13),text: 'Search Here...',))
            ],
          ),
        )
      ),
    );
  }
}
