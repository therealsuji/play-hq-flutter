import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../helpers/app_colors.dart';
import '../../helpers/app_fonts.dart';
import '../../helpers/app_screen_utils.dart';
import '../../helpers/app_strings.dart';
import '../../helpers/app_utils.dart';
import '../../models/game_details_models/game_details_arguments.dart';
import '../../view_models/profile/main_profile/main_profile_model.dart';
import '../../widgets/custom_game_widget.dart';
import '../../widgets/custom_text_widget.dart';

class MainProfileScreen extends StatefulWidget {
  @override
  _MainProfileScreenState createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MainProfileModel>().getProfileDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(50)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    // TODO: Pass the user details to the settings screen
                    onTap: () => Navigator.pushNamed(context, SETTINGS_SCREEN,
                        arguments: context.read<MainProfileModel>().userDetails),
                    child: Container(
                      child: SvgPicture.asset('assets/icons/settings.svg'),
                    ),
                  ),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, NOTIFICATION_SCREEN),
                        child: Container(
                          margin: EdgeInsets.only(
                            left: ScreenUtils.getDesignWidth(30),
                          ),
                          child: SvgPicture.asset('assets/icons/notification.svg'),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
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
                  profileDetails.userDetails.displayName!,
                );
              },
            ),
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(30),
                left: 24,
                right: 24,
              ),
              child: CustomTextWidget(
                'Subscription Plan',
                isDynamic: false,
                style: Theme.of(context).primaryTextTheme.headline3,
                width: ScreenUtils.getDesignWidth(111),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 24, right: 24),
              child: _subscriptionPlan(
                'Pro Gamer Pack',
                'assets/images/xbox_background.png',
                '16 Days Remaining',
                2,
                3,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _subButtons('View History', false),
                  _subButtons('Get Add Ons', true),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30), left: 24, right: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextWidget(
                    'WishList Games',
                    isDynamic: false,
                    style: Theme.of(context).primaryTextTheme.headline3,
                    width: ScreenUtils.getDesignWidth(111),
                  ),
                  Spacer(),
                  CustomTextWidget(
                    'View All',
                    isDynamic: false,
                    width: ScreenUtils.getDesignWidth(40),
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: CircularBook,
                      foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Container(
                height: ScreenUtils.getDesignHeight(150),
                margin: EdgeInsets.only(top: 15, left: 24, right: 24),
                child: Consumer<MainProfileModel>(
                  builder: (_, val, __) {
                    return val.wishlistGames.length > 0
                        ? ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  GAME_DETAILS_SCREEN,
                                  arguments: GameDetailsArguments(
                                      gameId: val.wishlistGames[index].game.apiId),
                                ),
                                child: GamesWidget(
                                  title: val.wishlistGames[index].game.title ?? "",
                                  backgroundUrl: val.wishlistGames[index].game.boxCover ?? "",
                                  subTitle: val.wishlistGames[index].game.releaseDate != null
                                      ? DateTime.parse(val.wishlistGames[index].game.releaseDate!)
                                          .format('dd-MM-yyyy')
                                      : "Not mentioned",
                                  gradient: PRIMARY_GRADIENT,
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: ScreenUtils.getDesignHeight(15),
                              );
                            },
                            itemCount: val.wishlistGames.length)
                        : Container(
                            child: Center(
                              child: CustomTextWidget(
                                'No Games Added',
                                isDynamic: false,
                                style: Theme.of(context).primaryTextTheme.headline3,
                                width: ScreenUtils.getDesignWidth(111),
                              ),
                            ),
                          );
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30), left: 24, right: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextWidget(
                    'Library Games',
                    isDynamic: false,
                    style: Theme.of(context).primaryTextTheme.headline3,
                    width: ScreenUtils.getDesignWidth(111),
                  ),
                  Spacer(),
                  CustomTextWidget(
                    'View All',
                    isDynamic: false,
                    width: ScreenUtils.getDesignWidth(40),
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: CircularBook,
                      foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Container(
                height: ScreenUtils.getDesignHeight(150),
                margin: EdgeInsets.only(
                  top: 15,
                  left: 24,
                  right: 24,
                  bottom: ScreenUtils.getDesignHeight(30),
                ),
                child: Consumer<MainProfileModel>(
                  builder: (_, val, __) {
                    return val.libraryGames.length > 0
                        ? ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  GAME_DETAILS_SCREEN,
                                  arguments: GameDetailsArguments(
                                    gameId: val.libraryGames[index].game.apiId ?? 0,
                                  ),
                                ),
                                child: GamesWidget(
                                  title: val.libraryGames[index].game.title ?? "",
                                  backgroundUrl: val.libraryGames[index].game.boxCover ?? "",
                                  subTitle: val.wishlistGames[index].game.releaseDate != null
                                      ? DateTime.parse(
                                          val.libraryGames[index].game.releaseDate!,
                                        ).format('dd-MM-yyyy')
                                      : "Not mentioned",
                                  gradient: PRIMARY_GRADIENT,
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: ScreenUtils.getDesignHeight(15),
                              );
                            },
                            itemCount: val.libraryGames.length)
                        : Container(
                            child: Center(
                              child: CustomTextWidget(
                                'No Games Added',
                                isDynamic: false,
                                style: Theme.of(context).primaryTextTheme.headline3,
                                width: ScreenUtils.getDesignWidth(111),
                              ),
                            ),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subButtons(String text, bool emphasis) {
    return Container(
      height: ScreenUtils.getDesignHeight(45),
      width: ScreenUtils.getDesignWidth(155),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          gradient: emphasis ? PRIMARY_GRADIENT : null,
          border: emphasis ? null : Border.all(color: FILL_COLOR)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 11,
            fontFamily: CircularBook,
          ),
        ),
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
                image: NetworkImage(imagePath),
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
                fontFamily: CircularBook,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _subscriptionPlan(
      String name, String imagePath, String remaining, int purchases, int sales) {
    return Container(
      height: ScreenUtils.getDesignHeight(140),
      width: ScreenUtils.bodyWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              name,
              isDynamic: true,
              style: Theme.of(context).primaryTextTheme.headline2,
              maxWidth: ScreenUtils.getDesignWidth(180),
              minWidth: ScreenUtils.getDesignWidth(40),
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              child: CustomTextWidget(
                remaining,
                isDynamic: true,
                maxWidth: ScreenUtils.getDesignWidth(180),
                minWidth: ScreenUtils.getDesignWidth(40),
                style: TextStyle(
                  fontFamily: CircularBook,
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              height: 1,
              width: ScreenUtils.bodyWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _statistics('Sales', sales),
                  Container(
                    margin: EdgeInsets.only(
                      left: ScreenUtils.getDesignWidth(40),
                    ),
                    child: _statistics('Purchases', purchases),
                  ),
                  Spacer(),
                  Container(
                    width: ScreenUtils.getDesignWidth(85),
                    height: ScreenUtils.getDesignHeight(35),
                    decoration: BoxDecoration(
                      gradient: PRIMARY_GRADIENT,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Center(
                      child: CustomTextWidget(
                        'Change Pack',
                        isDynamic: false,
                        width: ScreenUtils.getDesignWidth(55),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 9,
                          fontFamily: CircularBook,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statistics(String stat, int amount) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            stat,
            isDynamic: true,
            minWidth: ScreenUtils.getDesignWidth(20),
            maxWidth: ScreenUtils.getDesignWidth(60),
            style: TextStyle(
              fontSize: 12,
              fontFamily: CircularBook,
              foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            child: CustomTextWidget(
              amount.toString() + ' Remaining',
              isDynamic: true,
              minWidth: ScreenUtils.getDesignWidth(20),
              maxWidth: ScreenUtils.getDesignWidth(100),
              style: TextStyle(
                fontSize: 12,
                fontFamily: CircularBook,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
