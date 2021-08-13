import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-enums.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/widgets/custom-button-widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';

class BuyerBody extends StatefulWidget {
  const BuyerBody({Key? key}) : super(key: key);

  @override
  _BuyerBodyState createState() => _BuyerBodyState();
}

class _BuyerBodyState extends State<BuyerBody> {

  final OrderTrack status = OrderTrack.RECEIVED;

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
          "Awaiting Seller Confirmation",
          style: Theme.of(context).primaryTextTheme.headline1!.copyWith(
            fontSize: 18.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtils.getDesignHeight(25.0),
          ),
          child: Text(
            "We’ve sent a request to the seller to confirm the sale of the game. Please confirm the order on your end when it is activated.",
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
            buttonText: "I want to Cancel",
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
          "Delivering your Order",
          style: Theme.of(context).primaryTextTheme.headline1!.copyWith(
            fontSize: 18.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtils.getDesignHeight(25.0),
          ),
          child: RichText(
            text: TextSpan(
              text: 'The order has been picked up from the seller and is own their way to you now. Please await delivery Estimated time of arrival ',
              style: Theme.of(context).primaryTextTheme.headline2!.copyWith(
                fontSize: 14.0,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '2.43pm',
                  style: Theme.of(context).primaryTextTheme.headline2!.copyWith(
                    fontSize: 14.0,
                    color: PRIMARY_COLOR,
                  ),
                ),
              ],
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
          "Confirm Order Received",
          style: Theme.of(context).primaryTextTheme.headline1!.copyWith(
            fontSize: 18.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtils.getDesignHeight(25.0),
          ),
          child: Text(
            "Awesome! Your game has been successfully delivered, please confirm that the game is as accurately described in the order details.",
            style: Theme.of(context).primaryTextTheme.headline2!.copyWith(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(
              top: ScreenUtils.getDesignHeight(49.0),
            ),
            width: double.infinity,
            height: ScreenUtils.getDesignHeight(50.0),
            child: Center(
              child: GradientText(
                text: "MY ORDER IS NOT AS DESCRIBED",
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
            top: ScreenUtils.getDesignHeight(40.0),
          ),
          child: CustomButton(
            buttonText: "Confirm Order",
            gradient: GREEN_GRADIENT,
            textFontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
