import 'package:flutter/material.dart';
import 'package:play_hq/blocs/sign_up_bloc.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/constants/route_constants.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';



class SignUpScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('assets/images/login-bg.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtils.getDesignWidth(24)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: ScreenUtils.getDesignHeight(273)),
                  child: CustomButton(buttonText: "Sign up with Email",onPressed: ()=>Navigator.pushNamed(context, SignUpOnBoardRoute),),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenUtils.getDesignHeight(54)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Divider(
                        color: Colors.white,
                        thickness: 2,
                        height: 2,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'OR',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.white,
                        thickness: 2,
                        height: 2,
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: ScreenUtils.getDesignHeight(40)),
                  child: _customSocialButton(
                      buttonColor: Color(0xff1877F2),
                      buttonText: "Sign up with Facebook",
                      logoPath: 'assets/images/facebook-logo.png'),
                ),Padding(
                  padding:  EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
                  child: _customSocialButton(
                      buttonColor: Colors.white,
                      buttonText: "Sign up with Google",
                      logoPath: 'assets/images/google-logo.png',
                  textColor: Colors.black
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _customSocialButton(
      {@required Color buttonColor, @required String logoPath, @required String buttonText, VoidCallback onPressed,Color textColor = Colors.white}) {
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
                margin: EdgeInsets.only(right:10 ),
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
