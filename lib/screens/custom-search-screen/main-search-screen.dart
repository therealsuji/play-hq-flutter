import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-assets.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/screens/custom-search-screen/sub-search-screens/clicked-search.dart';
import 'package:play_hq/screens/custom-search-screen/sub-search-screens/opening-search.dart';
import 'package:play_hq/view-models/custom-search/custom-search-model.dart';
import 'package:play_hq/view-models/search-game/search-game-view-model.dart';
import 'package:play_hq/widgets/custom-body.dart';
import 'package:provider/provider.dart';


class MainSearchScreen extends StatefulWidget {

  final SearchGameScreens? values;

  MainSearchScreen({this.values});

  @override
  _MainSearchScreenState createState() => _MainSearchScreenState();
}

class _MainSearchScreenState extends State<MainSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                BACKGROUND_IMAGE,
                fit: BoxFit.cover,
              ),
            ),
            Consumer<CustomSearchModel>(
              builder: (_ , val , __){
                return val.isCLicked ? ClickedSearch(values: widget.values,) : OpeningSearch();
              },
            )
          ],
        ),
      )
    );
  }

}
