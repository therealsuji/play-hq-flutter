import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

import '../helpers/app_colors.dart';

class GameListItem extends StatefulWidget {
  const GameListItem({Key? key}) : super(key: key);

  @override
  _GameListItemState createState() => _GameListItemState();
}

class _GameListItemState extends State<GameListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.bodyWidth,
      height: ScreenUtils.getDesignHeight(110),
      color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
    );
  }
}
