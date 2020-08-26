import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/blocs/nav_bloc.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/my_flutter_app_icons.dart';
import 'package:play_hq/screens/discover_screen.dart';
import 'package:play_hq/screens/home_screen.dart';
import 'package:play_hq/screens/messages_screen.dart';
import 'package:play_hq/screens/profile_screen.dart';
import 'package:play_hq/widgets/customNav/custom_animtion.dart';
import 'package:play_hq/widgets/customNav/custom_navbar_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  NavBloc _navBloc;


  @override
  void didChangeDependencies() {

    super.didChangeDependencies();

    _navBloc = Provider.of<NavBloc>(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.poll, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      floatingActionButton:
      Container(margin: EdgeInsets.only(bottom: 25), child: FancyFab()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: StreamBuilder(
          stream: _navBloc.pageChanged,
          initialData: NavBar.Home,
          builder: (context, AsyncSnapshot<NavBar> snapshot) {
            switch (snapshot.data) {
              case NavBar.Home:
                return HomeScreen();
              case NavBar.Discover:
                return DiscoverScreen();
              case NavBar.Messages:
                return MessagesScreen();
              case NavBar.Profile:
                return Container(
                  child: ProfileScreen()
                );
              default:
                return Container();
            }
          }),
    );
  }
}
