import 'package:flutter/material.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';

class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FancyFab({this.onPressed, this.tooltip, this.icon});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Animation<double> _leftanimtion;
  final _height = ScreenUtils.totalBodyHeight;
  final _width = ScreenUtils.bodyWidth;
  Animation<double> _rightanimation;
  Curve _curve = Curves.easeOut;
  double _fabHeight = ScreenUtils.getDesignHeight(50);
  double _fabWidth = ScreenUtils.getDesignWidth(60);

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -5.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));

    _leftanimtion = Tween<double>(
      begin: _fabWidth,
      end:  - ScreenUtils.getDesignWidth(10),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));

    _rightanimation = Tween<double>(
      begin: - _fabWidth,
      end: ScreenUtils.getDesignWidth(14.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget add() {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        height: ScreenUtils.getDesignHeight(50),
        width: ScreenUtils.getDesignWidth(50),
        decoration: BoxDecoration(shape: BoxShape.circle , color: Primary,),
        child: Center(child: Icon(Icons.account_balance , color: Color(0xffB5BDD5))),
      ),
    );
  }

  Widget image() {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        height: ScreenUtils.getDesignHeight(50),
        width: ScreenUtils.getDesignWidth(50),
        decoration: BoxDecoration(
          shape: BoxShape.circle ,
          color: Primary,),
        child: Center(child: Icon(Icons.ac_unit , color: Color(0xffB5BDD5))),
      ),
    );
  }

  Widget inbox() {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        height: ScreenUtils.getDesignHeight(50),
        width: ScreenUtils.getDesignWidth(50),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Primary,),
        child: Center(child: Icon(Icons.print , color: Color(0xffB5BDD5),)),
      ),
    );
  }

  Widget toggle() {
    return GestureDetector(
      onTap: (){
        animate();
        print('clicked');
      },
      child: Container(
        height: ScreenUtils.getDesignHeight(50),
        decoration:
            BoxDecoration(
                shape: BoxShape.circle,
                color: Primary,
            ),
        child: Center(
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            color: Colors.white,
            progress: _animateIcon,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: add(),
        ),
        Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translateButton.value,
              0.0,
            ),
            child: Container(
              width: ScreenUtils.getDesignWidth(170),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform(
                      transform: Matrix4.translationValues(
                          _leftanimtion.value, 0.0, 0.0),
                      child: image()),
                  Transform(
                      transform: Matrix4.translationValues(
                          _rightanimation.value, 0.0, 0.0),
                      child: inbox()),
                ],
              ),
            )),
        toggle(),
      ],
    );
  }
}
