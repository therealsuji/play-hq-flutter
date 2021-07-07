import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-constants.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/view-models/select-game-types-view-model/select-game-types-model.dart';
import 'package:play_hq/widgets/custom-expander-widget.dart';
import 'package:play_hq/widgets/select-game-item-widget.dart';
import 'package:provider/provider.dart';

class GameTypes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtils.getDesignHeight(40), left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Let\'s get Started',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: HEADER_TEXT_COLOR,
                          fontFamily: Neusa),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      'Select what kind of games you like',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: HEADER_TEXT_COLOR.withOpacity(0.6),
                          fontFamily: CircularBook),
                    ),
                  ),
                ],
              ),
            ),
            Consumer<SelectGameTypesModel>(
              builder: (_, value, __) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  child: CustomExpanderWidget(
                    height: value.currentState == false
                        ? ScreenUtils.getDesignHeight(50)
                        : ScreenUtils.getDesignHeight(210),
                    iconData: value.currentState == false
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.keyboard_arrow_up_rounded,
                    state: value.currentState,
                    titleText: 'Genre',
                    selectedText: 'None Selected',
                    widget: _genreListWidget(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _genreListWidget() {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 20),
    height: ScreenUtils.getDesignHeight(130),
    child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 15,
          );
        },
        itemCount: genreList.length,
        itemBuilder: (BuildContext context, index) {
          return SelectGameItem(
            titleText: genreList[index]['name'],
            imageURL: genreList[index]['image_background'],
          );
        }),
  );
}
