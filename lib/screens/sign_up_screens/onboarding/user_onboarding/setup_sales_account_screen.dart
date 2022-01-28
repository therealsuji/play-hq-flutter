import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/onboarding/setup_purchase_account_view_model/purchase_account_model.dart';
import 'package:play_hq/view_models/onboarding/setup_sales_account_view_model/sales-account-model.dart';
import 'package:play_hq/widgets/custom_body.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_dotted_selector_widget.dart';
import 'package:play_hq/widgets/custom_game_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/widgets/custom_textfield_widget.dart';
import 'package:play_hq/widgets/game_picker_widget.dart';
import 'package:provider/provider.dart';

class SetupSalesAccountScreen extends StatefulWidget {
  @override
  _SetupSalesAccountScreenState createState() =>
      _SetupSalesAccountScreenState();
}

class _SetupSalesAccountScreenState extends State<SetupSalesAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(
        paddingTop: ScreenUtils.getDesignHeight(45),
        paddingBottom: ScreenUtils.getDesignHeight(30),
        paddingRight: 24,
        paddingLeft: 24,
        body: [
          Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      'Almost There! ',
                      isDynamic: false,
                      height: ScreenUtils.getDesignHeight(30),
                      width: ScreenUtils.getDesignWidth(180),
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline1
                          ?.copyWith(fontFamily: Neusa),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        child: CustomTextWidget(
                          'We just wannt a few more details',
                          isDynamic: false,
                          height: ScreenUtils.getDesignHeight(20),
                          width: ScreenUtils.getDesignWidth(220),
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline4
                              ?.copyWith(
                                  fontFamily: CircularBook,
                                  color: Colors.white.withOpacity(0.6)),
                        )),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
            child: Row(
              children: [
                CustomTextWidget(
                  'Any Games you\'d like to buy?',
                  isDynamic: false,
                  style: Theme.of(context).primaryTextTheme.headline3,
                  width: ScreenUtils.getDesignWidth(180),
                  height: ScreenUtils.getDesignHeight(20),
                ),
                Spacer(),
                CustomTextWidget(
                  'None Selected',
                  isDynamic: false,
                  style: TextStyle(
                      fontFamily: CircularBook,
                      foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR,
                      fontSize: 10),
                  height: ScreenUtils.getDesignHeight(13),
                ),
              ],
            ),
          ),
          ChangeNotifierProvider.value(
            value: Provider.of<SetupSalesModel>(context),
            child: CustomGamePicker(gameType: GamePicker.SalesLibrary,),
          ),
          Container(
              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
              child: CustomTextWidget(
                'Enter your mobile number',
                isDynamic: false,
                style: Theme.of(context).primaryTextTheme.headline3,
                width: ScreenUtils.getDesignWidth(180),
                height: ScreenUtils.getDesignHeight(20),
              )),
          CustomTextfieldWidget(
            hintText: 'Enter Phone Number...',
            iconData: Icons.local_phone_rounded,
            hideText: false,
            type: TextInputType.phone,
            onChanged: null,
          ),
          Container(
              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
              child: CustomTextWidget(
                'Let us know your location',
                isDynamic: false,
                style: Theme.of(context).primaryTextTheme.headline3,
                width: ScreenUtils.getDesignWidth(180),
                height: ScreenUtils.getDesignHeight(20),
              )),
          Container(
            margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(10)),
            child: CustomTextWidget(
              'Why we need it',
              isDynamic: false,
              style: TextStyle(
                  fontFamily: CircularBook,
                  foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR,
                  fontSize: 12),
              height: ScreenUtils.getDesignHeight(15),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 30,
                  color: SUB_TEXT_COLOR,
                ),
                Consumer<SetupSalesModel>(
                  builder: (_, value, __) {
                    return Container(
                      width: ScreenUtils.getDesignWidth(110),
                      margin: EdgeInsets.only(left: 15),
                      child: CustomTextWidget(
                        value.selectedAddress.isEmpty
                            ? 'Add your location'
                            : value.selectedAddress,
                        isDynamic: true,
                        maxWidth: ScreenUtils.getDesignWidth(120),
                        minWidth: ScreenUtils.getDesignWidth(30),
                        style: TextStyle(
                            fontFamily: CircularBook,
                            fontWeight: FontWeight.w500,
                            color: SUB_TEXT_COLOR,
                            fontSize: 12),
                        height: ScreenUtils.getDesignHeight(15),
                      ),
                    );
                  },
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => locator<NavigationService>()
                      .pushNamed(CUSTOM_ADDRESS_SEARCH_SCREEN),
                  child: Container(
                    height: ScreenUtils.getDesignHeight(40),
                    width: ScreenUtils.getDesignWidth(110),
                    decoration: BoxDecoration(
                      gradient: PRIMARY_GRADIENT,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Consumer<SetupSalesModel>(
                      builder: (_, value, __) {
                        return Center(
                          child: CustomTextWidget(
                            value.selectedAddress.isEmpty
                                ? 'Add Here'
                                : 'Change Now',
                            isDynamic: true,
                            maxWidth: ScreenUtils.getDesignWidth(55),
                            minWidth: ScreenUtils.getDesignWidth(45),
                            style: TextStyle(
                                fontFamily: CircularBook,
                                fontWeight: FontWeight.bold,
                                color: MAIN_TEXT_COLOR,
                                fontSize: 10),
                            height: ScreenUtils.getDesignHeight(12),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(170)),
              child: CustomButton(
                  gradient: PRIMARY_GRADIENT,
                  buttonText: 'GAME ON!',
                  onPressed: () => Provider.of<SetupSalesModel>(context , listen: false).performAPIRequest()))
        ],
      ),
    );
  }

  Widget _libraryGames() {
    final model = Provider.of<SetupSalesModel>(context);
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: ScreenUtils.getDesignHeight(160),
      child: Row(
        children: [
          CustomDottedSelectorWidget(onPressed: () async {
            dynamic gameDetails = await Navigator.pushNamed(
                context, MAIN_SEARCH_SCREEN,
                arguments: SearchGameScreens.SetupSales);
            if (gameDetails != null) {
              Provider.of<SetupSalesModel>(context, listen: false)
                  .addSelectedGame(gameDetails);
            }
          }),
          ChangeNotifierProvider.value(
            value: model,
            child: Consumer<SetupSalesModel>(
              builder: (_, val, __) {
                return val.selectedGameList.isEmpty
                    ? Container()
                    : Expanded(
                        child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 15,
                              );
                            },
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: val.selectedGameList.length,
                            itemBuilder: (context, index) {
                              return GamesWidget(
                                gameName: val.selectedGameList[index].title,
                                color: PRIMARY_COLOR,
                                backgroundUrl:
                                    val.selectedGameList[index].boxCover,
                                releaseDate:
                                    val.selectedGameList[index].releaseDate,
                              );
                            }),
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
