import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/screens/nav_bar_screens/friend_activity_screen.dart';
import 'package:play_hq/screens/screens.dart';
import 'package:play_hq/screens/profile_screens/profile_screen/new_profile_screen.dart';
import 'package:play_hq/view_models/navigation/tab_navigation_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: MAIN_CONTAINER_COLOR,
          onTap: (index) => Provider.of<TabNavigationModel>(context, listen: false).changeTab(index),
          currentIndex: Provider.of<TabNavigationModel>(context).currentPage,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                HOME_ICON,
              ),
              label: '',
              activeIcon: SvgPicture.asset(
                HOME_ICON,
                color: PRIMARY_COLOR,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                DISCOVER_ICON,
              ),
              label: '',
              activeIcon: SvgPicture.asset(
                DISCOVER_ICON,
                color: PRIMARY_COLOR,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                FRIENDS_ICON,
              ),
              label: '',
              activeIcon: SvgPicture.asset(
                FRIENDS_ICON,
                color: PRIMARY_COLOR,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                PROFILE_ICON,
              ),
              label: '',
              activeIcon: SvgPicture.asset(
                PROFILE_ICON,
                color: PRIMARY_COLOR,
              ),
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
      body: Consumer<TabNavigationModel>(
        builder: (context, value, child) {
          switch (value.currentPage) {
            case 0:
              return HomeScreen();
            case 1:
              return DiscoverScreen();
            case 2:
              return FriendActivity();
            case 3:
              return TestingPage();
            default:
              return Container();
          }
        },
      ),
    );
  }
}
