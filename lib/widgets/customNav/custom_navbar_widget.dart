import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/blocs/nav_bloc.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:provider/provider.dart';

class CurvedNavigationBar extends StatefulWidget {
  final List<Widget> items;
  final int index;

  final Color color;
  final Color buttonBackgroundColor;
  final Color backgroundColor;
  final ValueChanged<int> onTap;
  final Curve animationCurve;
  final Duration animationDuration;

  final double height;

  CurvedNavigationBar({
    Key key,
    @required this.items,
    this.index = 2,
    this.color = Colors.white,
    this.buttonBackgroundColor,
    this.backgroundColor = Colors.blueAccent,
    this.onTap,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    this.height = 58.0,
  })  : assert(items != null),
        assert(items.length >= 0),
        assert(0 <= height && height <= 58.0),
        super(key: key);

  @override
  CurvedNavigationBarState createState() => CurvedNavigationBarState();
}

class CurvedNavigationBarState extends State<CurvedNavigationBar>
    with SingleTickerProviderStateMixin {
  double _startingPos;
  int _endingIndex = 0;
  double _pos;
  double _buttonHide = 0;
  Widget _icon;
  Curve _curve = Curves.easeOut;
  int _length;

  bool isOpened = false;

  NavBloc _navBloc;

  List<Map<String, String>> _bottomNav = [
    {'icon': 'assets/icons/home.svg'},
    {'icon': 'assets/icons/discover.svg'},
    {'icon': 'assets/icons/home.svg',},
    {'icon': 'assets/icons/message.svg'},
    {'icon': 'assets/icons/profile.svg'},
  ];

  @override
  void initState() {
    super.initState();
    _length = 5;
    _pos = 2 / 5;
    _startingPos = widget.index / _length;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _navBloc = Provider.of<NavBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: BottomNavColor,
      height: widget.height,
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (58.0 - widget.height),
            child: SizedBox(
              height: 58.0,
              child: StreamBuilder(
                  stream: _navBloc.navigationEvent,
                  builder: (context, snapshot) {
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: getBottomNavItems(snapshot.data).map((e) {
                          return e;
                        }).toList(),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  int _mapIndex() {
    _bottomNav.map((val) {
      int index = _bottomNav.indexOf(val);

      return index;
    });
  }

  List<Widget> getBottomNavItems(int selectedIndex) {
    List<Widget> icons = [];

    for (int i = 0, j = _bottomNav.length; i < j; i++) {
      icons.add(
          _bottomNavigationBarItem(_bottomNav[i]['icon'], i, selectedIndex));
    }

    return icons;
  }

  Widget _bottomNavigationBarItem(String icon, int index, int selectedIndex) {
    return GestureDetector(
      onTap: (){
        _navBloc.setNavigationEvent.add(index);
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              color: index != selectedIndex ? index == 2 ? BottomNavColor : Unselected : Primary,
            ),
          ],
        ),
      ),
    );
  }
}
