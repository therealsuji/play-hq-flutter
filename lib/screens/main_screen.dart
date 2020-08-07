import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/blocs/nav_bloc.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/my_flutter_app_icons.dart';
import 'package:play_hq/screens/discover_screen.dart';
import 'package:play_hq/screens/home_screen.dart';
import 'package:play_hq/screens/messages_screen.dart';
import 'package:play_hq/screens/profile_screen.dart';


List<Widget> _children = [
  HomeScreen(),
  DiscoverScreen(),
  MessagesScreen(),
  ProfileScreen()
];

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  NavBloc _bloc = NavBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,
      bottomNavigationBar: StreamBuilder(
        stream: _bloc.indexStream,
        initialData: 0,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            currentIndex: snapshot.data?? 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: BottomNavColor,
            items: [
              BottomNavigationBarItem(
                title: Text('Home'),
                icon: SvgPicture.asset('assets/icons/home.svg', color: snapshot.data == 0 ? Primary : Unselected ,)
              ),
              BottomNavigationBarItem(
                title: Text('Discover'),
                icon: SvgPicture.asset('assets/icons/discover.svg' , color: snapshot.data == 1 ? Primary : Unselected)
              ),
              BottomNavigationBarItem(
                title: Text('Messages'),
                icon: SvgPicture.asset('assets/icons/message.svg' , color: snapshot.data == 2 ? Primary : Unselected)
              ),
              BottomNavigationBarItem(
                title: Text('Profile'),
                icon: SvgPicture.asset('assets/icons/profile.svg' , color: snapshot.data == 3 ? Primary : Unselected)
              ),
            ],
            unselectedItemColor: Unselected,
            onTap: (index)=> _bloc.indexSink.add(index),
            showSelectedLabels: false,
            showUnselectedLabels: false,
          );
        }
      ),
      body: StreamBuilder(
        initialData: 0,
        stream: _bloc.indexStream,
        builder: (context , snapshot){
          return _children[snapshot.data];
        },
      ),
    );
  }
}
