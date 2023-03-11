import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../helpers/app_assets.dart';
import '../../helpers/app_colors.dart';
import '../../helpers/app_fonts.dart';
import '../../helpers/app_screen_utils.dart';
import '../../helpers/app_strings.dart';
import '../../models/common_models/game_preferences/response_body.dart';
import '../../models/game_details_models/game_details_arguments.dart';
import '../../view_models/profile/main_profile/main_profile_model.dart';
import '../../widgets/custom_game_widget.dart';
import '../../widgets/custom_text_widget.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 2);
    context.read<MainProfileModel>().getProfileDetails(null);
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
                                          onTap: () => Navigator.pushNamed(context, NOTIFICATION_SCREEN),
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
                                vm.userDetails.name?.trim().length == 0 ? 'No Name :(' : '${vm.userDetails.name}',
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
                                child: Consumer<MainProfileModel>(builder: (_, val, __) {
                                  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    InfoBox(value: val.wishlistGames.length, label: "Wishlist Games"),
                                    InfoBox(value: 2, label: "Friends"),
                                    InfoBox(value: val.libraryGames.length, label: "Library Games"),
                                  ]);
                                }),
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

Widget _pageViewChild(List<Data> list) {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.only(top: 20),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.7,
        physics: NeverScrollableScrollPhysics(),
        children: list
            .map(
              (e) => GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  GAME_DETAILS_SCREEN,
                  arguments: GameDetailsArguments(
                    gameId: int.parse(e.id),
                  ),
                ),
                child: GamesWidget(
                  backgroundUrl: e.game.boxCover,
                  height: ScreenUtils.getDesignHeight(195),
                  title: e.game.boxCover,
                ),
              ),
            )
            .toList(),
      ),
    );
  });
}

class InfoBox extends StatelessWidget {
  final int value;
  final String label;
  const InfoBox({Key? key, required this.value, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextWidget(value.toString(),
              style: Theme.of(context).primaryTextTheme.headline3!.copyWith(fontSize: 26)),
          CustomTextWidget(label, style: Theme.of(context).primaryTextTheme.bodyText2),
        ],
      ),
    );
  }
}

Widget _userDetails(String imagePath, String name, String username) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: ScreenUtils.getDesignHeight(80),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            image: DecorationImage(
              image: CachedNetworkImageProvider(imagePath),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 20),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            "@$username",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white.withOpacity(0.6),
                fontSize: 16,
                fontFamily: CircularBook),
          ),
        ),
      ],
    ),
  );
}
