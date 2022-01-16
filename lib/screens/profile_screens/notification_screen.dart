import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';

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
          child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 24, right: 24),
              child: Row(
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
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 30),
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
          ],
        ),
      )),
    );
  }
}
