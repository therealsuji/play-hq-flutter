import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/helpers/app-service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/services/nav-service.dart';
import 'package:play_hq/widgets/custom-button-widget.dart';
import 'package:play_hq/services/auth_service.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: BACKGROUND_COLOR,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtils.getDesignWidth(24)),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(100)),
                  width: ScreenUtils.getDesignWidth(186),
                  child: Image.asset('assets/images/logo.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(130)),
                  child: Container(
                    width: double.infinity,
                    height: ScreenUtils.getDesignHeight(45),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: CONTAINER_COLOR),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset('assets/icons/facebook.svg'),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: ScreenUtils.getDesignWidth(20)),
                            child: Text(
                              'Continue with Facebook',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: CircularBold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => locator<AuthService>().login(LOGIN_PROVIDER.GOOGLE),
                  child: Container(
                    margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25)),
                    child: Container(
                      width: double.infinity,
                      height: ScreenUtils.getDesignHeight(45),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: CONTAINER_COLOR),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: SvgPicture.asset('assets/icons/Google.svg'),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: ScreenUtils.getDesignWidth(20)),
                              child: Text(
                                'Continue with Google',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: CircularBold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => locator<NavigationService>().pushNamed(PURCHASE_ACCOUNT_SCREEN),
                  child: Container(
                    margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(65)),
                    child: CustomButton(
                      buttonColor: PRIMARY_COLOR,
                      buttonText: 'I want to Explore',
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'By signing up you indicate that you agree with',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: CircularBold,
                              color: Colors.white)),
                      TextSpan(
                          text: ' Play HQ\'s',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: CircularBold,
                              color: PRIMARY_COLOR))
                    ]),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'Terms of use',
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: CircularBold,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff474E59)),
                          ),
                        ),
                        VerticalDivider(
                          color: Color(0xff474E59),
                          thickness: 1,
                        ),
                        Container(
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: CircularBold,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff474E59)),
                          ),
                        ),
                        VerticalDivider(
                          color: Color(0xff474E59),
                          thickness: 1,
                        ),
                        Container(
                          child: Text(
                            'Subscription Policy',
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: CircularBold,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff474E59)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _customSocialButton(
      {@required Color buttonColor,
      @required String logoPath,
      @required String buttonText,
      VoidCallback onPressed,
      Color textColor = Colors.white}) {
    return Container(
      width: double.infinity,
      height: ScreenUtils.getDesignHeight(45),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0), side: BorderSide(color: buttonColor)),
        color: buttonColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: ScreenUtils.getDesignHeight(20),
                width: ScreenUtils.getDesignWidth(20),
                margin: EdgeInsets.only(right: 10),
                child: Image.asset(logoPath)),
            Text(
              buttonText,
              style: TextStyle(color: textColor, fontFamily: Neusa, fontSize: 18),
            ),
          ],
        ),
        onPressed: onPressed ?? () {},
      ),
    );
  }
}
