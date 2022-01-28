import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';

class SellerBody extends StatefulWidget {
  const SellerBody({Key? key}) : super(key: key);

  @override
  _SellerBodyState createState() => _SellerBodyState();
}

class _SellerBodyState extends State<SellerBody> {
  final OrderTrack status = OrderTrack.AWAITING;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case OrderTrack.AWAITING:
        return _awaitingSellerConfirmation();
      case OrderTrack.DELIVERING:
        return _deliveringYourOrder();
      case OrderTrack.RECEIVED:
        return _confirmOrderReceived();
      default:
        return Container();
    }
  }

  Widget _awaitingSellerConfirmation() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: ScreenUtils.getDesignHeight(15.0),
          ),
          color: Colors.amber,
          width: double.infinity,
          height: ScreenUtils.getDesignHeight(300.0),
        ),
        Text(
          "Awaiting Courier",
          style: Theme.of(context).primaryTextTheme.headline1!.copyWith(
                fontSize: 18.0,
              ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtils.getDesignHeight(25.0),
          ),
          child: Text(
            "We have dispathced a courier to your location. Please be patient until they arrive and confirm upon arrival.",
            style: Theme.of(context).primaryTextTheme.headline2!.copyWith(
                  fontSize: 14.0,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtils.getDesignHeight(120.0),
          ),
          child: CustomButton(
            buttonText: "Confirm Arrival",
            gradient: PRIMARY_GRADIENT,
            textFontSize: 14.0,
          ),
        ),
      ],
    );
  }

  Widget _deliveringYourOrder() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: ScreenUtils.getDesignHeight(15.0),
          ),
          color: Colors.amber,
          width: double.infinity,
          height: ScreenUtils.getDesignHeight(300.0),
        ),
        Text(
          "Delivering Game",
          style: Theme.of(context).primaryTextTheme.headline1!.copyWith(
                fontSize: 18.0,
              ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtils.getDesignHeight(25.0),
          ),
          child: Text(
            'The order is now being delivered to the buyer. You  will be redirected to the final phase once the buyer has confirmed arrival of the order.',
            style: Theme.of(context).primaryTextTheme.headline2!.copyWith(
                  fontSize: 14.0,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _confirmOrderReceived() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: ScreenUtils.getDesignHeight(15.0),
          ),
          color: Colors.amber,
          width: double.infinity,
          height: ScreenUtils.getDesignHeight(300.0),
        ),
        Text(
          "Game Delivered Successfully",
          style: Theme.of(context).primaryTextTheme.headline1!.copyWith(
                fontSize: 18.0,
              ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtils.getDesignHeight(25.0),
          ),
          child: Text(
            "The game has been delivered. Your money will be transferred into your account shortly. Please contact us if you had in any issues in receiving the money. Thanks a lot for using our services!",
            style: Theme.of(context).primaryTextTheme.headline2!.copyWith(
                  fontSize: 14.0,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(
              top: ScreenUtils.getDesignHeight(38.0),
            ),
            width: double.infinity,
            height: ScreenUtils.getDesignHeight(50.0),
            child: Center(
              child: GradientText(
                "I DIDN'T RECEIVED PAYMENT YET",
                gradient: PRIMARY_GRADIENT,
                style: Theme.of(context).primaryTextTheme.headline1!.copyWith(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          onTap: () {},
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtils.getDesignHeight(28.0),
          ),
          child: CustomButton(
            buttonText: "Confirm Payment",
            gradient: GREEN_GRADIENT,
            textFontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
