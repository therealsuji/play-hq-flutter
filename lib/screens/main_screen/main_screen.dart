import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/screens/profile_screens/main_profile_screen.dart';
import 'package:play_hq/screens/profile_screens/tester_screen.dart';
import 'package:play_hq/screens/screens.dart';
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
              icon: GestureDetector(
                onTap: () {
                  _showBottomSheet();
                },
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
              return MainProfileScreen();
            default:
              return Container();
          }
        },
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.black87.withOpacity(0.26),
      backgroundColor: POP_UP_CONTAINER_COLOR,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (c) => Container(
        height: ScreenUtils.getDesignHeight(263.0),
        child: Padding(
          padding: EdgeInsets.only(
            left: ScreenUtils.getDesignWidth(20.0),
            right: ScreenUtils.getDesignWidth(20.0),
            top: ScreenUtils.getDesignHeight(52.0),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    _bottomSheetBtn(
                      name: "My Sales",
                      characterImage: BUY_GAME_CHARACTER_IMAGE,
                      charcterAlignment: Alignment.bottomLeft,
                      backgroundGradient: PRIMARY_GRADIENT,
                      callback: () => Navigator.pushNamed(context, MY_SALES_ROUTE),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    _bottomSheetBtn(
                      name: "Create Sale",
                      characterImage: BUY_GAME_CHARACTER_IMAGE,
                      charcterAlignment: Alignment.bottomCenter,
                      backgroundGradient: PRIMARY_GRADIENT,
                      callback: () => Navigator.pushNamed(context, CREATE_SALE_ROUTE),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    _bottomSheetBtn(
                      name: "Buy Games",
                      characterImage: BUY_GAME_CHARACTER_IMAGE,
                      charcterAlignment: Alignment.bottomRight,
                      backgroundGradient: PRIMARY_GRADIENT,
                      callback: () => Navigator.pushNamed(context, BUY_GAMES_ROUTE),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: ScreenUtils.getDesignHeight(30.0),
                  bottom: ScreenUtils.getDesignHeight(10.0),
                ),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      CROSS_MARK_ICON,
                      color: Colors.white,
                      height: ScreenUtils.getDesignHeight(21.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomSheetBtn(
      {required String name,
      required String characterImage,
      required Alignment charcterAlignment,
      required LinearGradient backgroundGradient,
      required VoidCallback callback}) {
    return Expanded(
      flex: 5,
      child: GestureDetector(
        onTap: () {
          // pop the sheet before navigating
          Navigator.pop(context);
          callback();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(
              gradient: backgroundGradient,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(name, style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white)),
                ),
                Expanded(
                  child: Align(
                    alignment: charcterAlignment,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: ScreenUtils.getDesignHeight(90.0),
                      ),
                      child: Image.asset(characterImage),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
