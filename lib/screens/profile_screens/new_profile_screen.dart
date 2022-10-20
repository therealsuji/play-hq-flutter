import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../helpers/app_assets.dart';
import '../../helpers/app_colors.dart';
import '../../helpers/app_fonts.dart';
import '../../helpers/app_screen_utils.dart';
import '../../helpers/app_strings.dart';
import '../../models/common_models/game_preferences/response_body.dart';
import '../../view_models/profile/main_profile/main_profile_model.dart';
import '../../widgets/custom_game_widget.dart';

class TestingPage extends StatefulWidget {
  @override
  _TestingPageState createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 2);
    context.read<MainProfileModel>().getProfileDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              centerTitle: false,
              automaticallyImplyLeading: false,
              collapsedHeight: ScreenUtils.getDesignHeight(60),
              backgroundColor: BACKGROUND_COLOR,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: PRIMARY_GRADIENT,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: BACKGROUND_COLOR,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer<MainProfileModel>(builder: (_, vm, __) {
                      return Container(
                        margin: EdgeInsets.only(
                          top: ScreenUtils.getDesignHeight(50),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                children: [
                                  Text(
                                    'User Profile',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      fontFamily: Neusa,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () => Navigator.pushNamed(context, SETTINGS_SCREEN,
                                        arguments: context.read<MainProfileModel>().userDetails),
                                    child: Container(
                                      child: SvgPicture.asset(SETTINGS_ICON),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              Navigator.pushNamed(context, NOTIFICATION_SCREEN),
                                          child: Container(
                                            child: SvgPicture.asset(NOTIFICATION_ICON),
                                          ),
                                        ),
                                        Positioned(
                                          top: 2,
                                          left: 0,
                                          child: Container(
                                            height: 11,
                                            width: 11,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.green,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              height: ScreenUtils.getDesignHeight(100),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: ScreenUtils.getDesignHeight(15),
                              ),
                              child: Text(
                                vm.userDetails.name == null
                                    ? 'Damsara Perera'
                                    : '${vm.userDetails.name}',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '@${vm.userDetails.displayName}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.6),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: ScreenUtils.getDesignHeight(20),
                              ),
                              child: Container(
                                width: ScreenUtils.bodyWidth,
                                height: ScreenUtils.getDesignHeight(80),
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: ScreenUtils.getDesignHeight(80),
                                      width: ScreenUtils.getDesignWidth(100),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: MAIN_CONTAINER_COLOR,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '22',
                                            style: TextStyle(
                                              fontSize: 26,
                                              fontFamily: Neusa,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Wishlist Games',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: CircularBook,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white.withOpacity(0.6),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: ScreenUtils.getDesignHeight(80),
                                      width: ScreenUtils.getDesignWidth(100),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: MAIN_CONTAINER_COLOR,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '08',
                                            style: TextStyle(
                                              fontSize: 26,
                                              fontFamily: Neusa,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Gamer Friends',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: CircularBook,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white.withOpacity(0.6),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: ScreenUtils.getDesignHeight(80),
                                      width: ScreenUtils.getDesignWidth(100),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: MAIN_CONTAINER_COLOR,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '11',
                                            style: TextStyle(
                                              fontSize: 26,
                                              fontFamily: Neusa,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Library Games',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: CircularBook,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white.withOpacity(0.6),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
              expandedHeight: ScreenUtils.getDesignHeight(400),
              pinned: true,
              floating: true,
              elevation: 0,
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0.0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  height: ScreenUtils.getDesignHeight(45),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                      gradient: PRIMARY_GRADIENT,
                    ),
                    controller: _tabController,
                    tabs: [
                      // first tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Wishlist Games',
                      ),

                      // second tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Library Games',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Consumer<MainProfileModel>(
          builder: (_, value, __) {
            return Container(
              height: 1000,
              child: TabBarView(
                physics: ScrollPhysics(),
                controller: _tabController,
                children: [
                  _pageViewChild(value.wishlistGames),
                  _pageViewChild(value.libraryGames),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _pageViewChild(List<Data> games) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.only(top: 20),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 0.7,
      physics: NeverScrollableScrollPhysics(),
      children: games
          .map(
            (e) => GamesWidget(
              backgroundUrl: e.game.boxCover,
              height: ScreenUtils.getDesignHeight(195),
              color: Colors.red,
              title: e.game.title,
            ),
          )
          .toList(),
    ),
  );
}
