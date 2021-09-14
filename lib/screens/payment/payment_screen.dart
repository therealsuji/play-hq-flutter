import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/view_models/payment/payment_model.dart';
import 'package:play_hq/widgets/custom_app_bar_widget.dart';
import 'package:play_hq/widgets/custom_body.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void dispose() {
    super.dispose();
    // Payment data should be reset when going to previous screen.
    Provider.of<PaymentModel>(context, listen: false).reset();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<PaymentModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(
        paddingLeft: 0.0,
        paddingRight: 0.0,
        paddingTop: 0,
        body: [
          CustomAppBarWidget(
            title: "Final Touches",
            showNotificationIcon: false,
          ),
          Container(
            color: MAIN_CONTAINER_COLOR.withOpacity(0.4),
            margin: EdgeInsets.only(top: 15.0),
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pricing",
                        style: Theme.of(context).primaryTextTheme.headline3,
                      ),
                      Container(
                        width: double.infinity,
                        height: 3.0,
                        margin: EdgeInsets.only(top: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: PRIMARY_COLOR,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: Theme.of(context).primaryTextTheme.bodyText1,
                            ),
                            Text(
                              "123" + " LKR",
                              style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(color: PRIMARY_COLOR),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Charges",
                              style: Theme.of(context).primaryTextTheme.bodyText1,
                            ),
                            Text(
                              "1232" + " LKR",
                              style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(color: PRIMARY_COLOR),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: MAIN_CONTAINER_COLOR.withOpacity(0.4),
                  margin: EdgeInsets.only(top: 15.0),
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Amount",
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      ),
                      GradientText(
                        text: "1232" + " LKR",
                        gradient: GREEN_GRADIENT,
                        style: Theme.of(context).primaryTextTheme.bodyText1!,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: MAIN_CONTAINER_COLOR.withOpacity(0.4),
            margin: EdgeInsets.only(top: 15.0),
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pickup Information",
                  style: Theme.of(context).primaryTextTheme.headline3,
                ),
                Container(
                  width: double.infinity,
                  height: 3.0,
                  margin: EdgeInsets.only(top: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: PRIMARY_COLOR,
                  ),
                ),
                _informationTile(
                    icon: TRUCK_ICON,
                    title: "Pickup From",
                    subtitle:
                        "SOME LONG ADRESSS SOME LONG ADRESSS SOME LONG ADRESSS SOME LONG ADRESSS SOME LONG ADRESSS"),
                _informationTile(icon: PHONE_ICON, title: "Contact Information", subtitle: "0711212121"),
                _informationTile(icon: PROFILE_ICON, title: "Recipiant Name", subtitle: "John Doe"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CustomButton(
                    buttonText: "Change Details",
                    gradient: PRIMARY_GRADIENT,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: MAIN_CONTAINER_COLOR.withOpacity(0.4),
            margin: EdgeInsets.only(top: 15.0),
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Option",
                        style: Theme.of(context).primaryTextTheme.headline3,
                      ),
                      Container(
                        width: double.infinity,
                        height: 3.0,
                        margin: EdgeInsets.only(top: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: PRIMARY_COLOR,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(CARD_ICON, color: SUB_TEXT_COLOR),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("123123123123", style: Theme.of(context).primaryTextTheme.headline4),
                                            Container(
                                              width: 20.0,
                                              height: 20.0,
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: PRIMARY_GRADIENT,
                                              ),
                                              child: SvgPicture.asset(CHECK_ICON, color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GradientText(
                                    text: "Edit Card Details",
                                    gradient: GREEN_GRADIENT,
                                    style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: GradientText(
                                      text: "Edit Card Details",
                                      gradient: ALERT_GRADIENT,
                                      style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 3.0,
                        margin: EdgeInsets.only(top: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: PRIMARY_COLOR,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                          buttonText: "Add New Card",
                          width: ScreenUtils.getDesignWidth(100.0),
                          gradient: PRIMARY_GRADIENT,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: CustomButton(buttonText: "Confirm Order", gradient: GREEN_GRADIENT),
          )
        ],
      ),
    );
  }

  Widget _informationTile({required icon, required title, required subtitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: ScreenUtils.getDesignWidth(17.0),
          ),
          child: SvgPicture.asset(
            icon,
            color: TEXT_COLOR,
          ),
        ),
        Expanded(
          child: Container(
            height: ScreenUtils.getDesignHeight(60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(color: SUB_TEXT_COLOR),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      subtitle,
                      style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                            color: SUB_TEXT_COLOR.withOpacity(0.6),
                          ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
