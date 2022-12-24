import 'package:flutter/material.dart';

import '../../helpers/app_colors.dart';
import '../../helpers/app_fonts.dart';
import '../../helpers/app_screen_utils.dart';
import '../../widgets/custom_text_widget.dart';
import '../../widgets/horizontal_scroll_widget.dart';

class FriendActivity extends StatefulWidget {
  const FriendActivity({Key? key}) : super(key: key);

  @override
  State<FriendActivity> createState() => _FriendActivityState();
}

class _FriendActivityState extends State<FriendActivity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CustomTextWidget(
                        "Notifications",
                        style: Theme.of(context).primaryTextTheme.headline2,
                      ),
                    ),
                    _friendRequests(),
                    Expanded(
                      flex: 1,
                      child: HorizontalScrollList(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 25,
                            ),
                            child: _friendRequestContainer(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: ScreenUtils.getDesignHeight(65),
                      color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Text(
                              'Friend Activity',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: Neusa,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'View All',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: CircularBook,
                                fontWeight: FontWeight.bold,
                                color: PRIMARY_COLOR,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: HorizontalScrollList(
                          itemCount: 5,
                          axis: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: friendActivityWidget(),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget friendActivityWidget() {
    return Container(
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
        borderRadius: BorderRadius.circular(5),
      ),
      height: ScreenUtils.getDesignHeight(85),
      width: ScreenUtils.bodyWidth,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Container(
              height: ScreenUtils.getDesignHeight(55),
              width: ScreenUtils.getDesignWidth(55),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Gisky ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: PRIMARY_COLOR,
                          fontFamily: Neusa,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'added Ghost of Tsushima to their Wishlist.',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: Neusa,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 14,
                        color: SUB_TEXT_COLOR,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _friendRequestContainer() {
    return Container(
      height: ScreenUtils.getDesignHeight(290),
      width: ScreenUtils.getDesignWidth(327),
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: ScreenUtils.getDesignWidth(50),
                    height: ScreenUtils.getDesignHeight(50),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'IAmDamasu ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: PRIMARY_COLOR,
                                fontFamily: Neusa,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'has sent you a friend request.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: Neusa,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '02 ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: PRIMARY_COLOR,
                                fontFamily: CircularBook,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'Wishlist Games in your Library',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: SUB_TEXT_COLOR,
                                    fontFamily: CircularBook,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: ScreenUtils.getDesignHeight(40),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        gradient: ALERT_GRADIENT,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Decline',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: GREEN_GRADIENT,
                      ),
                      child: Center(
                        child: Text(
                          'Accept',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _friendRequests() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: ScreenUtils.getDesignHeight(65),
      color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            Container(
              height: ScreenUtils.getDesignHeight(45),
              width: ScreenUtils.getDesignWidth(45),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Friend Requests',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: Neusa,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Accept or Reject Requests',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: CircularBook,
                      fontWeight: FontWeight.w500,
                      color: SUB_TEXT_COLOR,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              'View All',
              style: TextStyle(
                fontSize: 14,
                fontFamily: CircularBook,
                fontWeight: FontWeight.w500,
                color: PRIMARY_COLOR,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                gradient: PRIMARY_GRADIENT,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '27',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: CircularBook,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
