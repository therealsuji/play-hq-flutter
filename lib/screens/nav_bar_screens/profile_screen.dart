import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/common_models/game_preferences/response_body.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/profile/main_profile/main_profile_model.dart';
import 'package:play_hq/widgets/custom_game_widget.dart';
import 'package:play_hq/widgets/page_view_tab_widget.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

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
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(50)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () => locator<NavigationService>().pushNamed(SETTINGS_SCREEN),
                      child: Container(child: SvgPicture.asset(SETTINGS_ICON))),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () => locator<NavigationService>().pushNamed(NOTIFICATION_SCREEN),
                          child: Container(child: SvgPicture.asset(NOTIFICATION_ICON)),
                        ),
                        Positioned(
                          top: 2,
                          left: 0,
                          child: Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
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
                    profileDetails.userDetails.firstName! + ' ' + profileDetails.userDetails.lastName!,
                    profileDetails.userDetails.displayName!);
              },
            ),
            StickyHeaderBuilder(
              controller: controller,
              content: Consumer<MainProfileModel>(
                builder: (_, value, __) {
                  return Container(
                    height: 1000,
                    child: PageView(
                      physics: ScrollPhysics(),
                      controller: pageViewController,
                      onPageChanged: (index) => Provider.of<MainProfileModel>(context, listen: false)
                          .currentPageViewTab = ProfilePageViewTab.LIBRARY_TAB,
                      children: [pageViewChild(value.fetchAllWishlistGames), pageViewChild(value.fetchAllLibraryGames)],
                    ),
                  );
                },
              ),
              builder: (BuildContext context, double stuckAmount) {
                return Consumer<MainProfileModel>(
                  builder: (_, val, __) {
                    return Container(
                      color: BACKGROUND_COLOR,
                      padding: EdgeInsets.only(left: 24, right: 24, top: -1.0 >= stuckAmount ? 50 : 20, bottom: 20),
                      child: PageViewTab(
                        tabs: ['Wishlist Games', 'Library Games'],
                        activeTab: val.currentPageViewTab.index,
                        controller: pageViewController,
                        onTap: (index) => {val.currentPageViewTab = ProfilePageViewTab.values.elementAt(index)},
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget pageViewChild(List<Data> list) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 0.7,
      children: list
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

Widget _userDetails(String imagePath, String name, String username) {
  return Container(
    margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: ScreenUtils.getDesignHeight(90),
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
