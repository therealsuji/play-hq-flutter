import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/authentication/authentication_model.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    APICacheManager().emptyCache();
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: Container(
                  width: ScreenUtils.bodyWidth,
                  height: ScreenUtils.getDesignHeight(350),
                  child: Image.asset(
                    'assets/images/login-background.png',
                    fit: BoxFit.fill,
                  ),
                )),
            Positioned(bottom: 0, child: Stack(
              children: [
                Container(
                  height: ScreenUtils.getDesignHeight(485),
                  width: ScreenUtils.bodyWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15) , topRight: Radius.circular(15)),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15) , topRight: Radius.circular(15)),
                      child: Image.asset('assets/images/background.jpg' , fit: BoxFit.fill,)),
                ),
                Container(
                  height: ScreenUtils.getDesignHeight(485),
                  width: ScreenUtils.bodyWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15) , topRight: Radius.circular(15)),
                    color: BACKGROUND_COLOR
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40) , left: 24 , right: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget('Hey Dude!' , isDynamic: false , width: ScreenUtils.getDesignWidth(105) , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 24 , fontFamily: Neusa ),),
                        Container(
                            margin: EdgeInsets.only(top: 7),
                            child: CustomTextWidget(
                                "You stumbled upon a Gem. Sign up/in to see what’s there in store. \n You are gonna love it",
                                isDynamic: false , width: ScreenUtils.bodyWidth,style: TextStyle(color: SUB_TEXT_COLOR , fontSize: 14 , fontFamily: CircularBook ))),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40)),
                          child: Consumer<AuthenticationModel>(
                            builder: (_ , val , __){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => val.socialLogin(SocialLogin.GOOGLE),
                                    child: Container(
                                      height: ScreenUtils.getDesignHeight(99),
                                      width: ScreenUtils.getDesignWidth(99),
                                      decoration: BoxDecoration(
                                          color: MAIN_CONTAINER_COLOR.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      child: Image.asset('assets/images/google-logo.png'),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => val.socialLogin(SocialLogin.FACEBOOK),
                                    child: Container(
                                      height: ScreenUtils.getDesignHeight(99),
                                      width: ScreenUtils.getDesignWidth(99),
                                      decoration: BoxDecoration(
                                          color: MAIN_CONTAINER_COLOR.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      child: Image.asset('assets/images/facebook-logo.png'),
                                    ),
                                  ),
                                  Container(
                                    height: ScreenUtils.getDesignHeight(99),
                                    width: ScreenUtils.getDesignWidth(99),
                                    decoration: BoxDecoration(
                                        color: MAIN_CONTAINER_COLOR.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(5.0)
                                    ),
                                    child: Image.asset('assets/images/apple-logo.png'),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(bottom: ScreenUtils.getDesignHeight(35)),
                          child: CustomButton(
                            onPressed: () => locator<NavigationService>().pushNamed(MAIN_SCREEN),
                            buttonText: 'I want to Explore',gradient: PRIMARY_GRADIENT,),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
