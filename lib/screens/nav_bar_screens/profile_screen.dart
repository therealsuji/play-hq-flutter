import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

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
import '../profile_screens/profile_screen/page_view_tab_widget.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MainProfileModel>(context, listen: false).getProfileDetails();
  }

  PageController pageViewController = PageController();
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(top: ScreenUtils.getDesignHeight(50), bottom: 50),
            margin: EdgeInsets.only(bottom: 50),
            color: PRIMARY_COLOR,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, SETTINGS_SCREEN),
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
                                    child: SvgPicture.asset(
                                      NOTIFICATION_ICON,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 2,
                                  left: 0,
                                  child: Container(
                                    height: 11,
                                    width: 11,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Consumer<MainProfileModel>(
                      builder: (_, profileDetails, __) {
                        return _userDetails(
                            profileDetails.userDetails.avatar == ""
                                ? "https://i.stack.imgur.com/y9DpT.jpg"
                                : profileDetails.userDetails.avatar!,
                            profileDetails.userDetails.name!,
                            profileDetails.userDetails.displayName!);
                      },
                    ),
                  ],
                ),
                Positioned.fill(
                  bottom: -90,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Consumer<MainProfileModel>(builder: (_, val, __) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InfoBox(value: val.wishlistGames.length, label: "Wishlist Games"),
                            InfoBox(value: 2, label: "Friends"),
                            InfoBox(value: val.libraryGames.length, label: "Library Games"),
                          ],
                        );
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
          StickyHeader(
            controller: controller,
            header: Consumer<MainProfileModel>(
              builder: (_, val, __) {
                return Container(
                  color: BACKGROUND_COLOR,
                  padding: EdgeInsets.only(left: 24, right: 24, top: 50),
                  child: PageViewTab(
                    tabs: ['Wishlist Games', 'Library Games'],
                    activeTab: val.currentPageViewTab.index,
                    controller: pageViewController,
                    onTap: (index) =>
                        {val.currentPageViewTab = ProfilePageViewTab.values.elementAt(index)},
                  ),
                );
              },
            ),
            content: Consumer<MainProfileModel>(
              builder: (_, value, __) {
                return Container(
                  height: 1000,
                  child: PageView(
                    physics: ScrollPhysics(),
                    controller: pageViewController,
                    onPageChanged: (index) => Provider.of<MainProfileModel>(context, listen: false)
                        .currentPageViewTab = ProfilePageViewTab.values.elementAt(index),
                    children: [
                      pageViewChild(value.wishlistGames , context),
                      pageViewChild(value.libraryGames , context)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget pageViewChild(List<Data> list , BuildContext context) {
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
          CustomTextWidget(value.toString(), style: Theme.of(context).primaryTextTheme.headline2),
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
