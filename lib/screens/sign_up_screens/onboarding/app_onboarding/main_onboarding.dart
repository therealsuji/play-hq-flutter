import 'package:flutter/material.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/app_colors.dart';
import '../../../../helpers/app_constants.dart';
import '../../../../helpers/app_enums.dart';
import '../../../../helpers/app_fonts.dart';
import '../../../../helpers/app_screen_utils.dart';
import '../../../../helpers/app_strings.dart';
import '../../../../injection_container.dart';
import '../../../../view_models/main_onboarding/main_onboarding_model.dart';
import '../../../../widgets/custom_button_widget.dart';
import '../../../../widgets/custom_text_widget.dart';
import '../../../../widgets/dotted_indicator_widget.dart';

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
            Consumer<MainOnboardingModel>(builder: (_, value, __) {
              return Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      child: PageView.builder(
                          controller: value.pageController,
                          itemCount: onboardingData.length,
                          onPageChanged: (val) =>
                              Provider.of<MainOnboardingModel>(context, listen: false)
                                  .changePage(val),
                          itemBuilder: (BuildContext context, index) {
                            return _onboarding(
                                onboardingData[index]['image'],
                                onboardingData[index]['title'],
                                onboardingData[index]['description']);
                          }),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: ScreenUtils.getDesignHeight(40), left: 24, right: 24),
                    child: value.currentPage == 3
                        ? CustomButton(
                            buttonText: 'Setup Preferances',
                            width: ScreenUtils.bodyWidth,
                            gradient: PRIMARY_GRADIENT,
                            onPressed: () => sl<NavigationService>().pushAndRemoveUntil(PURCHASE_ACCOUNT_SCREEN , args: true)
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              value.currentPage == 0
                                  ? Container(
                                      width: ScreenUtils.getDesignWidth(30),
                                      height: ScreenUtils.getDesignHeight(18),
                                    )
                                  : Visibility(
                                      visible: value.currentPage > 0 ? true : false,
                                      child: GestureDetector(
                                        onTap: () => value.currentPage > 0
                                            ? Provider.of<MainOnboardingModel>(context,
                                                    listen: false)
                                                .previousPage()
                                            : null,
                                        child: Container(
                                          alignment: Alignment.topRight,
                                          child: CustomTextWidget(
                                            'Back',
                                            isDynamic: false,
                                            width: ScreenUtils.getDesignWidth(30),
                                            height: ScreenUtils.getDesignHeight(18),
                                            style: TextStyle(
                                                fontFamily: CircularBook,
                                                fontWeight: FontWeight.w700,
                                                foreground: Paint()
                                                  ..shader = PRIMARY_GRADIENT_TEXT_COLOR,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                              DottedIndicatorWidget(
                                currentPage: value.currentPage,
                              ),
                              GestureDetector(
                                onTap: () =>
                                    Provider.of<MainOnboardingModel>(context, listen: false)
                                        .nextPage(),
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: CustomTextWidget(
                                    'Next',
                                    isDynamic: false,
                                    width: ScreenUtils.getDesignWidth(30),
                                    height: ScreenUtils.getDesignHeight(18),
                                    style: TextStyle(
                                      fontFamily: CircularBook,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  )
                ],
              );
            }),
            GestureDetector(
              onTap: () => sl<NavigationService>().pushAndRemoveUntil(PURCHASE_ACCOUNT_SCREEN),
              child: Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40), right: 24),
                child: CustomTextWidget(
                  'Skip',
                  isDynamic: false,
                  width: ScreenUtils.getDesignWidth(30),
                  height: ScreenUtils.getDesignHeight(18),
                  style: TextStyle(
                      fontFamily: CircularBook,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _onboarding(String image, String title, String description) {
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
                  title,
                  isDynamic: false,
                  width: ScreenUtils.getDesignWidth(178),
                  height: ScreenUtils.getDesignHeight(27),
                  style: TextStyle(
                      fontFamily: Neusa,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(20), left: 24, right: 24),
                child: CustomTextWidget(
                  description,
                  isDynamic: false,
                  width: ScreenUtils.bodyWidth,
                  style: TextStyle(
                      fontSize: 14,
                      color: SUB_TEXT_COLOR,
                      fontFamily: CircularBook,
                      fontWeight: FontWeight.w500),
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
