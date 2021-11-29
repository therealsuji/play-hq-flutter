import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/widgets/custom_textfield_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24 , right: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios_rounded , color: Colors.white),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 5),
                        child: CustomTextWidget('Settings' , isDynamic: false, width: ScreenUtils.getDesignWidth(75),style: Theme.of(context).primaryTextTheme.headline2,),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40)),
                  height: ScreenUtils.getDesignHeight(90),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU'),
                    ),
                  ),
                ),
                _profileDetails('Your Name', 'Damsara Perera', Icons.account_circle_outlined, 67),
                _profileDetails('Display Name', 'Damasu', Icons.account_circle_sharp, 85),
                _profileDetails('Mobile Number', '0774147787', Icons.call_outlined, 95),
                Container(
                    margin: EdgeInsets.only(left: 24 , right: 24 , top: 30),
                    child: CustomButton(buttonText: 'Save Changes' , gradient: PRIMARY_GRADIENT,)),
                Container(
                  margin: EdgeInsets.only(left: 24 , right: 24 , top: 30),
                  child: CustomTextWidget('My Address' , isDynamic: false, width: ScreenUtils.getDesignWidth(72),style: Theme.of(context).primaryTextTheme.headline3,),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileDetails(String title , String labelText , IconData iconData , double width){
    return Container(
      margin: EdgeInsets.only(top: 30 , left: 24 , right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(title , isDynamic: false, width: ScreenUtils.getDesignWidth(width),style: Theme.of(context).primaryTextTheme.headline3,),
          CustomTextfieldWidget(labelText: labelText,iconData: iconData,hideText: false,),
        ],
      ),
    );
  }
}
