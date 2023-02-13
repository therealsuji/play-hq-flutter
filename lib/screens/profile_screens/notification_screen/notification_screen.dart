import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/widgets/notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 24, right: 24 , top: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 5),
                        child: CustomTextWidget(
                          'Notifications',
                          isDynamic: false,
                          width: ScreenUtils.getDesignWidth(115),
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: ScreenUtils.getDesignHeight(40),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: ScreenUtils.getDesignWidth(75),
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                'Wishlist Games',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            )
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: PRIMARY_GRADIENT,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                              child: Text(
                                'Orders',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent
                            ),
                            child: Center(
                              child: Text(
                                'General',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(20)),
                      child: Text('Mark all as Read' , style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(color: PRIMARY_COLOR),)),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25)),
                    child: ListView.separated(itemBuilder: (BuildContext context , int length){
                      return NotificationWidget(iconPath: 'assets/icons/tick_box.svg' , notificationColor: Colors.blue);
                      } , separatorBuilder: (BuildContext context , int index){
                        return SizedBox(
                          height: ScreenUtils.getDesignHeight(15),
                        );
                      } , itemCount: 10, shrinkWrap: true,),)
                ],
              ),
            ),
          )),
    );
  }
}
