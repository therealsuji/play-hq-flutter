import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import '../../service_locator.dart';

class MainProfileScreen extends StatefulWidget {
  @override
  _MainProfileScreenState createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtils.getDesignHeight(50)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () => locator<NavigationService>().pushNamed(SETTINGS_SCREEN),
                      child: Container(child: SvgPicture.asset('assets/icons/settings.svg'))),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () => locator<NavigationService>().pushNamed(NOTIFICATION_SCREEN),
                        child: Container(
                            margin:
                                EdgeInsets.only(left: ScreenUtils.getDesignWidth(30)),
                            child: SvgPicture.asset('assets/icons/notification.svg')),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 11,
                          width: 11,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            _userDetails(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU',
                'Damsara Perera',
                '@Damasu007'),
            Container(
              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30) , left: 24 , right: 24),
              child: CustomTextWidget(
                'Subscription Plan',
                isDynamic: false,
                style: Theme.of(context).primaryTextTheme.headline3,
                width: ScreenUtils.getDesignWidth(111),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15 , left: 24 , right: 24),
              child: _subscriptionPlan('Pro Gamer Pack',
                  'assets/images/xbox_background.png', '16 Days Remaining', 2, 3),
            ),
            Container(
              margin: EdgeInsets.only(top: 15 , left: 24 , right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _subButtons('View History', false),
                  _subButtons('Get Add Ons', true)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30) , left: 24 , right: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextWidget(
                    'Library Games',
                    isDynamic: false,
                    style: Theme.of(context).primaryTextTheme.headline3,
                    width: ScreenUtils.getDesignWidth(111),
                  ),
                  Spacer(),
                  CustomTextWidget('View All', isDynamic: false , width: ScreenUtils.getDesignWidth(40),style: TextStyle(fontSize: 10 , fontFamily: CircularBook , foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR, fontWeight: FontWeight.w700),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subButtons(String text , bool emphasis){
    return Container(
      height: ScreenUtils.getDesignHeight(45),
      width: ScreenUtils.getDesignWidth(155),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        gradient: emphasis ? PRIMARY_GRADIENT : null,
        border: emphasis ? null : Border.all(color: FILL_COLOR)
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white, fontSize: 11, fontFamily: CircularBook),
        ),
      ),
    );
  }

  Widget _userDetails(String imagePath, String name, String username) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: ScreenUtils.getDesignHeight(90),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              image: DecorationImage(
                image: NetworkImage(imagePath),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              username,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 16,
                  fontFamily: CircularBook),
            ),
          ),
        ],
      ),
    );
  }

  Widget _subscriptionPlan(String name, String imagePath, String remaining,
      int purchases, int sales) {
    return Container(
        height: ScreenUtils.getDesignHeight(140),
        width: ScreenUtils.bodyWidth,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5.0)),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                name,
                isDynamic: true,
                style: Theme.of(context).primaryTextTheme.headline2,
                maxWidth: ScreenUtils.getDesignWidth(180),
                minWidth: ScreenUtils.getDesignWidth(40),
              ),
              Container(
                margin: EdgeInsets.only(top: 3),
                child: CustomTextWidget(
                  remaining,
                  isDynamic: true,
                  maxWidth: ScreenUtils.getDesignWidth(180),
                  minWidth: ScreenUtils.getDesignWidth(40),
                  style: TextStyle(
                      fontFamily: CircularBook,
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Colors.white.withOpacity(0.6)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 1,
                width: ScreenUtils.bodyWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _statistics('Sales', sales),
                    Container(
                        margin: EdgeInsets.only(left: ScreenUtils.getDesignWidth(40)),
                        child: _statistics('Purchases', purchases)),
                    Spacer(),
                    Container(
                      width: ScreenUtils.getDesignWidth(85),
                      height: ScreenUtils.getDesignHeight(35),
                      decoration: BoxDecoration(
                          gradient: PRIMARY_GRADIENT,
                          borderRadius: BorderRadius.circular(3.0)
                      ),
                      child: Center(
                        child: CustomTextWidget(
                          'Change Pack',
                          isDynamic: false,
                          width: ScreenUtils.getDesignWidth(55),
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white , fontSize: 9 , fontFamily: CircularBook),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _statistics(String stat , int amount){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(stat, isDynamic: true , minWidth: ScreenUtils.getDesignWidth(20),maxWidth: ScreenUtils.getDesignWidth(60),style: TextStyle(fontSize: 12 , fontFamily: CircularBook , foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR, fontWeight: FontWeight.w700),
          ),
          Container(
              margin: EdgeInsets.only(top: 2),
              child: CustomTextWidget(amount.toString() + ' Remaining', isDynamic: true , minWidth: ScreenUtils.getDesignWidth(20),maxWidth: ScreenUtils.getDesignWidth(100) , style: TextStyle(fontSize: 12 , fontFamily: CircularBook , color: Colors.white, fontWeight: FontWeight.bold) ,))
        ],
      ),
    );
  }
}
