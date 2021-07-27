import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/widgets/custom-button-widget.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  double pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  pageIndex = index.toDouble();
                });
              },
              children: [
                middleContainer(
                    illustrationPath: 'assets/images/logo.png', title: 'Play HQ', body: "Swipe to Learn More"),
                middleContainer(
                    illustrationPath: 'assets/images/logo.png',
                    title: 'Play HQ',
                    body:
                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et"),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtils.getDesignWidth(24)),
              child: Column(
                children: [
                  Container(
                    child: DotsIndicator(
                      dotsCount: 6,
                      position: pageIndex,
                      decorator: DotsDecorator(
                        size: Size(12, 12),
                        spacing: EdgeInsets.all(4),
                        color: Colors.transparent,
                        activeSize: Size(12, 12),
                        shape: CircleBorder(side: BorderSide(color: PRIMARY_COLOR, width: 2)),
                        activeColor: PRIMARY_COLOR,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: ScreenUtils.getDesignHeight(80)),
                    child: CustomButton(
                      buttonText: "Sign Up",
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: ScreenUtils.getDesignHeight(10)),
                    child: CustomButton(
                      buttonText: "Login",
                      buttonColor: BACKGROUND_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget middleContainer({
    required String illustrationPath,
    required String title,
    required String body,
  }) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(130)),
          height: ScreenUtils.getDesignHeight(150),
          width: ScreenUtils.getDesignWidth(150),
          child: Image.asset(illustrationPath),
        ),
        Padding(
          padding: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25)),
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontFamily: Neusa, fontSize: 30),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(50)),
            height: ScreenUtils.getDesignHeight(100),
            padding: EdgeInsets.symmetric(horizontal: ScreenUtils.getDesignWidth(24)),
            alignment: Alignment.bottomCenter,
            child: Text(
              body,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: landingPageViewBodyColor.withOpacity(0.8), fontFamily: CircularBold, fontSize: 18),
            )),
      ],
    );
  }
}
