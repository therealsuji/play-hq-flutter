import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/app_colors.dart';
import '../../helpers/app_enums.dart';
import '../../helpers/app_screen_utils.dart';
import '../../helpers/app_strings.dart';
import '../../models/common_models/game_list_arguments_model.dart';
import '../../models/game_details_models/game_details_arguments.dart';
import '../../view_models/game_lists/game_list_view_model.dart';
import '../../widgets/game_list_item.dart';

class GameListScreen extends StatefulWidget {
  final GameListArguments? gameListArguments;

  GameListScreen({this.gameListArguments});

  @override
  _GameListScreenState createState() => _GameListScreenState();
}

class _GameListScreenState extends State<GameListScreen> {
  @override
  void initState() {
    switch (widget.gameListArguments!.apiType) {
      case GameLists.TOP_RATED_GAMES:
        Provider.of<GameListViewModel>(context, listen: false).fetchTopRatedGames();
        break;
      case GameLists.RECOMMENDED:
        Provider.of<GameListViewModel>(context, listen: false).fetchAllRecommendedGames();
        break;
      case GameLists.MOST_ANTICIPATED_GAMES:
        Provider.of<GameListViewModel>(context, listen: false).fetchUpcomingGames();
        break;
      case GameLists.GAMES_OF_2022:
        Provider.of<GameListViewModel>(context, listen: false).fetchGamesOf2022();
        break;
      case GameLists.UPCOMING_GAMES:
        Provider.of<GameListViewModel>(context, listen: false).fetchUpcomingGames();
        break;
      case GameLists.GENRE:
        Provider.of<GameListViewModel>(context, listen: false)
            .fetchGamesFromGenre(widget.gameListArguments?.args?['genre'] ?? "");
        break;
      case GameLists.DEVELOPER:

      default:
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: Container(
          margin: EdgeInsets.only(
              left: ScreenUtils.getDesignWidth(24.0),
              right: ScreenUtils.getDesignWidth(24.0),
              top: ScreenUtils.getDesignHeight(60.0)),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  // Text 'Game List'
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtils.getDesignWidth(5.0)),
                    child: Text(
                      widget.gameListArguments!.screenTitle!,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Consumer<GameListViewModel>(
                builder: (_, val, __) {
                  return val.gameResponse.isNotEmpty
                      ? Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtils.getDesignHeight(20.0),
                                bottom: ScreenUtils.getDesignHeight(20.0)),
                            child: ListView.separated(
                              itemCount: val.gameResponse.length,
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    GAME_DETAILS_SCREEN,
                                    arguments: GameDetailsArguments(
                                      gameId: val.gameResponse[index].id,
                                    ),
                                  ),
                                  child: GameListItem(
                                    gameName: val.gameResponse[index].name,
                                    boxCover: val.gameResponse[index].backgroundImage,
                                    secondaryDetails: val.gameResponse[index].released,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: ScreenUtils.getDesignHeight(15),
                                );
                              },
                            ),
                          ),
                        )
                      : Flexible(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'No Games Found',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        ));
  }
}
