import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/view-models/search-game/search-game-view-model.dart';
import 'package:provider/provider.dart';

class ClickedSearch extends StatefulWidget {

  @override
  _ClickedSearchState createState() => _ClickedSearchState();
}

class _ClickedSearchState extends State<ClickedSearch> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40) , left: 24 , right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _customSearchTextfield(true)
          ],
        ),
      ),
    );
  }

  Widget _customSearchTextfield(bool active) {
    return GestureDetector(
      onTap: () {},
      child: TextFormField(
          style: TextStyle(
            color: TEXT_COLOR,
            fontSize: 18,
          ),
          obscureText: false,
          focusNode: FocusScopeNode().focusedChild,
          keyboardType: TextInputType.name,
          onChanged: (val) =>
              Provider.of<SearchGameModel>(context, listen: false)
                  .searchGames(val),
          cursorColor: PRIMARY_COLOR,
          decoration: InputDecoration(
            prefixIcon: Container(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Icon(
                Icons.search,
                color: SUB_TEXT_COLOR,
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
        ),
    );
  }
}
