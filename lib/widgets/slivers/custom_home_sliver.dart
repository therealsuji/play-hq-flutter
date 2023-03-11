import 'dart:math';

import 'package:flutter/material.dart';
import 'package:play_hq/widgets/skeletons/user_skeleton.dart';
import 'package:provider/provider.dart';

import '../../helpers/app_assets.dart';
import '../../helpers/app_colors.dart';
import '../../helpers/app_enums.dart';
import '../../helpers/app_screen_utils.dart';
import '../../helpers/app_strings.dart';
import '../../models/common_models/game_list_arguments_model.dart';
import '../../screens/nav_bar_screens/widgets/genre_widget.dart';
import '../../view_models/home_screen/home_screen_model.dart';
import '../skeletons/genre_skeleton.dart';

class SliverContent extends StatelessWidget {
  final String displayName;

  const SliverContent({
    required this.displayName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: BACKGROUND_COLOR),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(gradient: PRIMARY_GRADIENT),
                ),
              ),
              Container(
                height: ScreenUtils.getDesignHeight(280) / 6,
                decoration: BoxDecoration(
                  color: BACKGROUND_COLOR,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              left: 24,
              right: 24,
              top: ScreenUtils.getDesignHeight(70.0),
            ),
            child: Consumer<HomeScreenModel>(
              builder: (_, value , __) {
                return Column(
                  children: [
                    value.hasInitialDataLoaded ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome $displayName",
                              style: Theme.of(context).primaryTextTheme.displayMedium!.copyWith(
                                fontSize: 22
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtils.getDesignHeight(2.0),
                            ),
                            Text(
                              "Any particular games you’d like to\nbuy today?",
                              style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                                    color: Colors.white.withOpacity(0.70),
                                fontSize: 15
                                  ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 24.0,
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              right: 0.0,
                              height: ScreenUtils.getDesignWidth(15.0),
                              width: ScreenUtils.getDesignWidth(15.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: GREEN_GRADIENT,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ) : UserSkeleton(),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        MAIN_SEARCH_SCREEN,
                        arguments: SearchType.MAIN_SEARCH,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: ScreenUtils.getDesignHeight(25.0),
                        ),
                        width: double.infinity,
                        height: ScreenUtils.getDesignHeight(50.0),
                        decoration: BoxDecoration(
                          color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: ScreenUtils.getDesignWidth(15.0),
                              ),
                              child: Icon(
                                Icons.search_rounded,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: ScreenUtils.getDesignWidth(5.0),
                              ),
                              child: Text(
                                "Search Here...",
                                style: Theme.of(context).primaryTextTheme.headline5!.copyWith(
                                      color: Colors.white.withOpacity(0.70),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      child: Row(
                        mainAxisAlignment: value.prefGenres.length > 2 ?  MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
                        children: value.hasInitialDataLoaded
                            ? value.prefGenres
                            .map((e) => Container(
                          margin: EdgeInsets.only(right: value.prefGenres.length > 2 ? 0 : 25),
                          child: InkWell(
                            child: GenreWidget(
                              //TODO: this needs to be dynamic
                              gradient: GENRE_GRADIENT,
                              name: e.name ?? "",
                              imageUrl: 'assets/images/genres/${e.name!.toLowerCase()}.png',
                            ),
                            onTap: () => Navigator.pushNamed(
                              context,
                              GAME_LIST_SCREEN,
                              arguments: GameListArguments(
                                screenTitle: "${e.name ?? ''} Games",
                                apiType: GameLists.GENRE,
                                args: {
                                  "genre": e.id.toString(),
                                },
                              ),
                            ),
                          ),
                        ))
                            .toList()
                            : <Widget>[for (int i = 0; i < 3; i++) SkeletonGenreWidget()],
                      )
                    ),
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
