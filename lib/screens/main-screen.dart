import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app-assets.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/screens/nav-bar-screens/discover-screen.dart';
import 'package:play_hq/screens/nav-bar-screens/orders-screen.dart';
import 'package:play_hq/view-models/navigation/tab-navigation-model.dart';
import 'package:provider/provider.dart';

import 'nav-bar-screens/home-screen.dart';
import 'nav-bar-screens/profile-screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     Icons.add,
      //     size: 30,
      //   ),
      //   onPressed: () => showPostGame(),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
              icon: GestureDetector(
                onTap: () => Navigator.pushNamed(context, CREATE_SALE_ROUTE),
                child: Container(
                  padding: EdgeInsets.all(
                    ScreenUtils.getDesignHeight(11.0),
                  ),
                  decoration: BoxDecoration(
                    gradient: PRIMARY_GRADIENT,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(ADD_ICON),
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ORDERS_ICON,
              ),
              label: '',
              activeIcon: SvgPicture.asset(
                ORDERS_ICON,
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
            case 3:
              return OrdersScreen();
            case 4:
              return ProfileScreen();
            default:
              return Container();
          }
        },
      ),
    );
  }

  void showPostGame() {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.black87.withOpacity(0.26),
      backgroundColor: BACKGROUND_COLOR,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (c) => Container(
        color: PRIMARY_COLOR,
        height: ScreenUtils.getDesignHeight(135.0),
      ),
    );
  }
}
