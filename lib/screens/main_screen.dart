import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/screens/discover_screen.dart';
import 'package:play_hq/screens/home_screen.dart';
import 'package:play_hq/screens/orders-screen.dart';
import 'package:play_hq/screens/profile_screen.dart';
import 'package:play_hq/view-models/navigation/tab_navigation_model.dart';
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
      floatingActionButton: FloatingActionButton(onPressed: () => null , child: Icon(Icons.add , size: 30,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: CONTAINER_COLOR,
          onTap: (index) => Provider.of<TabNavigationModel>(context, listen: false).changeTab(index),
          currentIndex: Provider.of<TabNavigationModel>(context).currentPage,
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/home.svg') , label: '' , activeIcon: SvgPicture.asset('assets/icons/home.svg' , color: PRIMARY_COLOR,)),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/discover.svg') , label: '' , activeIcon: SvgPicture.asset('assets/icons/discover.svg' , color: PRIMARY_COLOR,)),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/transparent.svg') , label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/orders.svg') , label: '' , activeIcon: SvgPicture.asset('assets/icons/orders.svg' , color: PRIMARY_COLOR,)),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/profile.svg') , label: '' , activeIcon: SvgPicture.asset('assets/icons/profile.svg' , color: PRIMARY_COLOR,)),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
      body: Consumer<TabNavigationModel>(
        builder: (context, value, child) {
          switch (value.currentPage) {
            case 0:
              return HomeScreen();
              break;
            case 1:
              return DiscoverScreen();
              break;
            case 3:
              return OrdersScreen();
              break;
            case 4:
              return ProfileScreen();
              break;
            default:
              return Container();
          }
        },
      ),
    );
  }
}
