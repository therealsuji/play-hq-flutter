import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';

import '../helpers/app_colors.dart';
import '../helpers/app_fonts.dart';

class GameListItem extends StatefulWidget {

  final String? boxCover;
  final String? gameName;
  final String? secondaryDetails;

  GameListItem({
    this.boxCover,
    this.gameName,
    this.secondaryDetails,
  });

  @override
  _GameListItemState createState() => _GameListItemState();
}

class _GameListItemState extends State<GameListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.bodyWidth,
      height: ScreenUtils.getDesignHeight(110),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Container(
              width: ScreenUtils.getDesignWidth(60),
              height: ScreenUtils.getDesignHeight(80),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: NetworkImage(widget.boxCover!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget( widget.gameName! , isDynamic: true, maxWidth: ScreenUtils.getDesignWidth(180) , minWidth: ScreenUtils.getDesignWidth(50) , style: TextStyle(
                    fontSize: 16,
                    fontFamily: Neusa,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: CustomTextWidget( widget.secondaryDetails! , isDynamic: true, maxWidth: ScreenUtils.getDesignWidth(180) , minWidth: ScreenUtils.getDesignWidth(50) , style: TextStyle(
                      fontSize: 14,
                      fontFamily: Neusa,
                      color: PRIMARY_COLOR,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: ScreenUtils.getDesignWidth(23),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: PRIMARY_GRADIENT,
              ),
              child: Container(
                child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
