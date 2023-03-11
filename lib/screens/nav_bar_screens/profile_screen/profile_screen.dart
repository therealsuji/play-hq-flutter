// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

import 'package:play_hq/screens/nav_bar_screens/profile_screen/gridview_widget.dart';
import 'package:play_hq/screens/nav_bar_screens/profile_screen/profile_detail_box_widget.dart';

import '../../../helpers/app_assets.dart';
import '../../../helpers/app_colors.dart';
import '../../../helpers/app_fonts.dart';
import '../../../helpers/app_screen_utils.dart';
import '../../../helpers/app_strings.dart';
import '../../../models/common_models/game_preferences/response_body.dart';
import '../../../view_models/profile/main_profile/main_profile_model.dart';

class ProfileScreen extends StatefulWidget {
  final String? userEmail;

  ProfileScreen({
    Key? key,
    this.userEmail,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
  var showUserActivityBtns = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 2);
    context.read<MainProfileModel>().getProfileDetails(widget.userEmail);
    if (widget.userEmail!.isNotEmpty) {
      setState(() {
        showUserActivityBtns = true;
      });
      _scrollController.addListener(() {
        if (_scrollController.offset > 180) {
          setState(() {
            showUserActivityBtns = false;
          });
        } else {
          setState(() {
            showUserActivityBtns = true;
          });
        }
      });
    }
  }

  var innerScrollController;

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
              collapsedHeight: ScreenUtils.getDesignHeight(80),
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
                            flex: widget.userEmail!.isEmpty ? 2 : 3,
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
                                    onTap: () async {
                                      var res = await Navigator.pushNamed(context, SETTINGS_SCREEN,
                                          arguments: context.read<MainProfileModel>().userDetails);

                                      if (res != null || res == true) {
                                        context.read<MainProfileModel>().getUserDetails();
                                      }
                                    },
                                    child: Container(
                                      child: SvgPicture.asset(SETTINGS_ICON),
                                    ),
                                  ),
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
                                vm.userDetails.name == null ? 'No Username' : '${vm.userDetails.name}',
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
                                child: vm.hasInitialDataLoaded
                                    ? ProfileDetailsBox(
                                        wishlistCount: vm.wishlistGames.length,
                                        libraryCount: vm.libraryGames.length,
                                        gamerfriendCount: 08,
                                      )
                                    : SkeletonProfileDetails())
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
              expandedHeight: ScreenUtils.getDesignHeight(widget.userEmail!.isEmpty ? 380 : 430),
              pinned: true,
              floating: true,
              elevation: 0,
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      Visibility(
                        visible: showUserActivityBtns,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: CustomButton(
                                  buttonText: "Report User",
                                  gradient: ALERT_GRADIENT,
                                  height: ScreenUtils.getDesignHeight(45.0),
                                  textFontSize: 14.0,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                flex: 1,
                                child: CustomButton(
                                  buttonText: "Report User",
                                  gradient: ALERT_GRADIENT,
                                  height: ScreenUtils.getDesignHeight(45.0),
                                  textFontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Container(
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
                  ],
                ),
              ),
            ),
          ];
        },
        body: Consumer<MainProfileModel>(
          builder: (context, value, __) {
            return Container(
              height: 1000,
              child: TabBarView(
                physics: ScrollPhysics(),
                controller: _tabController,
                children: [
                  _pageViewChild(value.wishlistGames, context, value.hasInitialDataLoaded),
                  _pageViewChild(value.libraryGames, context, value.hasInitialDataLoaded),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _pageViewChild(List<Data> games, BuildContext context, bool isLoaded) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: isLoaded
          ? CustomGridView(
              games: games,
            )
          : GridViewSkeleton(count: 4));
}
