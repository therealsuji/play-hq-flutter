import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app-colors.dart';

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
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/home.svg') , label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/discover.svg') , label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/transparent.svg') , label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/orders.svg') , label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/profile.svg') , label: ''),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
      body: Container()
    );
  }
}
