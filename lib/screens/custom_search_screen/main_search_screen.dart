import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/screens/custom_search_screen/sub_search_screens/clicked_search.dart';
import 'package:play_hq/screens/custom_search_screen/sub_search_screens/opening_search.dart';
import 'package:play_hq/view_models/custom_search/custom_search_model.dart';
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
                return val.isClicked ? ClickedSearch(values: widget.values) : OpeningSearch();
              },
            )
          ],
        ),
      )
    );
  }

}
