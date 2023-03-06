import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../../../helpers/app_colors.dart';
import '../../../helpers/app_constants.dart';
import '../../../helpers/app_screen_utils.dart';
import '../../../helpers/app_strings.dart';
import '../../../models/common_models/game_preferences/response_body.dart';
import '../../../models/game_details_models/game_details_arguments.dart';
import '../../../widgets/custom_game_widget.dart';

class CustomGridView extends StatelessWidget {
  final List<Data>? games;

  const CustomGridView({this.games});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.only(top: 20),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 0.7,
      physics: NeverScrollableScrollPhysics(),
      children: games!
          .map(
            (e) => GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                GAME_DETAILS_SCREEN,
                arguments: GameDetailsArguments(
                  gameId: e.game.apiId,
                  title: e.game.title
                ),
              ),
              child: GamesWidget(
                backgroundUrl: e.game.boxCover,
                height: ScreenUtils.getDesignHeight(195),
                color: PRIMARY_COLOR,
                title: e.game.title,
                titleFontSize: 16,
                subTitleFontSize: 14,
                subTitle: platforms.firstWhere(
                    (element) => element['id'] == e.platform)['name'],
              ),
            ),
          )
          .toList(),
    );
  }
}

class GridViewSkeleton extends StatelessWidget {
  final double height;
  final double width;
  final count;

  const GridViewSkeleton(
      {Key? key, this.height = 195, this.width = 100, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 0.7),
        padding: EdgeInsets.only(top: 20),
        itemCount: count,
        itemBuilder: (BuildContext ctx, int index) {
          return SkeletonGridItemWidget(
            height: ScreenUtils.getDesignHeight(195),
          );
        });
  }
}

class SkeletonGridItemWidget extends StatelessWidget {
  final double height;
  final double width;

  const SkeletonGridItemWidget({Key? key, this.height = 200, this.width = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonLine(
      style: SkeletonLineStyle(
          height: height, borderRadius: BorderRadius.circular(8)),
    );
  }
}
