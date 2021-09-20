import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
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
                    color: MAIN_CONTAINER_COLOR.withOpacity(0.85)
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40) , left: 24 , right: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(width: ScreenUtils.getDesignWidth(105) , text: 'Hey Dude!', style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 24 , fontFamily: Neusa ),),
                        Container(
                            margin: EdgeInsets.only(top: 7),
                            child: CustomTextWidget(width: ScreenUtils.bodyWidth, text: "You stumbled upon a Gem. Sign up/in to see what’s there in store. \n You are gonna love it",style: TextStyle(color: SUB_TEXT_COLOR , fontSize: 14 , fontFamily: CircularBook ))),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: ScreenUtils.getDesignHeight(99),
                                width: ScreenUtils.getDesignWidth(99),
                                decoration: BoxDecoration(
                                  color: POP_UP_CONTAINER_COLOR.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5.0)
                                ),
                                child: Image.asset('assets/images/google-logo.png'),
                              ),
                              Container(
                                height: ScreenUtils.getDesignHeight(99),
                                width: ScreenUtils.getDesignWidth(99),
                                decoration: BoxDecoration(
                                    color: POP_UP_CONTAINER_COLOR.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5.0)
                                ),
                                child: Image.asset('assets/images/facebook-logo.png'),
                              ),
                              Container(
                                height: ScreenUtils.getDesignHeight(99),
                                width: ScreenUtils.getDesignWidth(99),
                                decoration: BoxDecoration(
                                    color: POP_UP_CONTAINER_COLOR.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5.0)
                                ),
                                child: Image.asset('assets/images/apple-logo.png'),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(35)),
                          height: ScreenUtils.getDesignHeight(50),
                          width: ScreenUtils.bodyWidth,
                          decoration: BoxDecoration(
                            color: POP_UP_CONTAINER_COLOR.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.mail_outline , color: SUB_TEXT_COLOR,),
                                Container(margin: EdgeInsets.only(left: 5),
                                child: CustomTextWidget(text: 'Continue with Email' , width: ScreenUtils.getDesignWidth(115),height: 15,style: TextStyle(color: SUB_TEXT_COLOR , fontSize: 12 , fontWeight: FontWeight.w500 , fontFamily: CircularBook),),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(35)),
                          child: CustomButton(
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
