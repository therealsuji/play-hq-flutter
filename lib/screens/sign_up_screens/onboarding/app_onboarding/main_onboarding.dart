import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/main_onboarding/main_onboarding_model.dart';
import 'package:play_hq/view_models/view_models.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class MainOnboarding extends StatefulWidget {
  const MainOnboarding({Key? key}) : super(key: key);

  @override
  _MainOnboardingState createState() => _MainOnboardingState();
}




class _MainOnboardingState extends State<MainOnboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    child: PageView.builder(
                        itemCount: onboardingData.length,
                        onPageChanged: (val) => Provider.of<MainOnboardingModel>(context , listen: false).changePage(val),
                        itemBuilder: (BuildContext context , index){
                          return _onboarding(onboardingData[index]['image'], onboardingData[index]['title'], onboardingData[index]['description']);
                        }),
                  ),
                ),
                Spacer(),
                Consumer<MainOnboardingModel>(
                  builder: (context , value , child){
                    return  Container(
                      margin: EdgeInsets.only(bottom: 40 , left: 24 , right: 24),
                      child: value.currentPage == 3 ? CustomButton(buttonText: 'Setup Preferances' , width: ScreenUtils.bodyWidth, gradient: PRIMARY_GRADIENT,onPressed: () =>  locator<NavigationService>().pushNamed(SETUP_PURCHASE_ACCOUNT_ROUTE),) : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          value.currentPage == 0 ? Container(
                            width: ScreenUtils.getDesignWidth(30),
                            height: ScreenUtils.getDesignHeight(18),
                          ) : GestureDetector(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: CustomTextWidget(
                                width: ScreenUtils.getDesignWidth(30),
                                height: ScreenUtils.getDesignHeight(18),
                                text: 'Back',
                                style: TextStyle(fontFamily: CircularBook , fontWeight: FontWeight.w700, foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR , fontSize: 14),
                              ),
                            ),
                          ),
                          _dotIndicator(value.currentPage),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.topRight,
                              child: CustomTextWidget(
                                width: ScreenUtils.getDesignWidth(30),
                                height: ScreenUtils.getDesignHeight(18),
                                text: 'Next',
                                style: TextStyle(fontFamily: CircularBook , fontWeight: FontWeight.w700 , fontSize: 14 , foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
            GestureDetector(
              onTap: () => locator<NavigationService>().pushNamed(SETUP_PURCHASE_ACCOUNT_ROUTE),
              child: Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40) , right: 24),
                child: CustomTextWidget(
                  width: ScreenUtils.getDesignWidth(30),
                  height: ScreenUtils.getDesignHeight(18),
                  text: 'Skip',
                  style: TextStyle(fontFamily: CircularBook , fontWeight: FontWeight.w700, color: Colors.white , fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dotIndicator(int currentPage){
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 4),
            height: ScreenUtils.getDesignHeight(10),
            width: currentPage == 0 ? ScreenUtils.getDesignWidth(25) : ScreenUtils.getDesignWidth(10),
            decoration: BoxDecoration(
              shape: currentPage == 0 ? BoxShape.rectangle : BoxShape.circle,
              borderRadius: currentPage == 0 ? BorderRadius.circular(100) : null,
              gradient: currentPage == 0 ? PRIMARY_GRADIENT : null,
              color: currentPage == 0 ? null : SUB_TEXT_COLOR
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 4),
            height: ScreenUtils.getDesignHeight(10),
            width: currentPage == 1 ? ScreenUtils.getDesignWidth(25) : ScreenUtils.getDesignWidth(10),
            decoration: BoxDecoration(
                shape: currentPage == 1 ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: currentPage == 1 ? BorderRadius.circular(100) : null,
                gradient: currentPage == 1 ? PRIMARY_GRADIENT : null,
                color: currentPage == 1 ? null : SUB_TEXT_COLOR
            ),
          ),Container(
            margin: EdgeInsets.only(right: 4),
            height: ScreenUtils.getDesignHeight(10),
            width: currentPage == 2 ? ScreenUtils.getDesignWidth(25) : ScreenUtils.getDesignWidth(10),
            decoration: BoxDecoration(
                shape: currentPage == 2 ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: currentPage == 2 ? BorderRadius.circular(100) : null,
                gradient: currentPage == 2 ? PRIMARY_GRADIENT : null,
                color: currentPage == 2 ? null : SUB_TEXT_COLOR
            ),
          ),Container(
            height: ScreenUtils.getDesignHeight(10),
            width: currentPage == 3 ? ScreenUtils.getDesignWidth(25) : ScreenUtils.getDesignWidth(10),
            decoration: BoxDecoration(
                shape: currentPage == 3 ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: currentPage == 3 ? BorderRadius.circular(100) : null,
                gradient: currentPage == 3 ? PRIMARY_GRADIENT : null,
                color: currentPage == 3 ? null : SUB_TEXT_COLOR
            ),
          ),
        ],
      ),
    );
  }

  Widget _onboarding(String image , String title , String description){
    return Container(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(image),
              Container(
                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40)),
                child: CustomTextWidget(
                  width: ScreenUtils.getDesignWidth(178),
                  height: ScreenUtils.getDesignHeight(27),
                  text: title,
                  style: TextStyle(fontFamily: Neusa , fontWeight: FontWeight.bold , color: Colors.white , fontSize: 16),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(20) , left: 24 , right: 24),
                child: CustomTextWidget(
                  width: ScreenUtils.bodyWidth,
                  height: ScreenUtils.getDesignHeight(55),
                  text: description,
                  style: TextStyle(fontSize: 14 , color: SUB_TEXT_COLOR , fontFamily: CircularBook , fontWeight: FontWeight.w500),
                  align: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
