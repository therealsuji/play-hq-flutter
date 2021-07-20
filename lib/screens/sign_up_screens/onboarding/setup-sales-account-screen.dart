import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/helpers/app-service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/services/nav-service.dart';
import 'package:play_hq/widgets/custom-button-widget.dart';
import 'package:play_hq/widgets/custom-dotted-selector-widget.dart';
import 'package:play_hq/widgets/custom-smaller-button-widget.dart';
import 'package:play_hq/widgets/custom-textfield-widget.dart';

class SetupSalesAccountScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40)),
                child: Text('Almost There!', style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: Neusa),),
              ),
              Container(
                margin: EdgeInsets.only(top: 05),
                child: Text('Let\'s setup your Seller Account now!',
                  style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.6),
                      fontFamily: CircularBook),),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25)),
                child: Text('Setup your Game Library', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: CircularBook),),
              ),
              Container(
                  width: ScreenUtils.bodyWidth,
                  height: ScreenUtils.getDesignHeight(150),
                  margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    CustomDottedSelectorWidget(onPressed:() => locator<NavigationService>().pushNamed(SEARCH_SCREEN)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
                child: Text('Enter your Mobile Number', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: CircularBook),),
              ),
              CustomTextfieldWidget(iconData: Icons.call_outlined,type: TextInputType.phone,hideText: false,),
              Container(
                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
                child: Text('Let us know your Location', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: CircularBook),),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(5)),
                child: Text('Why we need it', style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: PRIMARY_COLOR,
                    fontFamily: CircularBook),),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Icon(Icons.add_location_alt_outlined , color: TEXT_COLOR, size: 25,),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('Add Location' , style: TextStyle(fontFamily: CircularBook , color: TEXT_COLOR , fontSize: 16 , fontWeight: FontWeight.w700),),
                    ),
                    Spacer(),
                    CustomSmallerButton(buttonText: 'Add from Map',buttonColor: PRIMARY_COLOR,),
                  ],
                ),
              ),
              Spacer(),
              Container(
                  margin: EdgeInsets.only(bottom: 25),
                  child: CustomButton(buttonColor: PRIMARY_COLOR,buttonText: 'Game on!',textFontSize: 18,))
            ],
          ),
        ),
      ),
    );
  }
}
