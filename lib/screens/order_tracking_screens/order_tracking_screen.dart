import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/widgets/custom-body.dart';
import 'package:play_hq/helpers/app-assets.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/screens/order_tracking_screens/body/buyer_body.dart';
import 'package:play_hq/screens/order_tracking_screens/body/seller_body.dart';
import 'package:play_hq/screens/order_tracking_screens/widgets/progress_animation.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> with SingleTickerProviderStateMixin {

  late bool _isBuyer;

  @override
  Widget build(BuildContext context) {

    // TODO: Fix the logic to find the buyer or seller
    _isBuyer = true;

    return Scaffold(
      body: CustomBody(
        body: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                child: SvgPicture.asset(
                  ARROW_LEFT,
                  height: ScreenUtils.getDesignHeight(27.0),
                ),
                onTap: () {},
              ),
              SizedBox(
                width: ScreenUtils.getDesignWidth(13.0),
              ),
              Text(
                "Order Tracking",
                style: Theme.of(context).primaryTextTheme.headline1!.copyWith(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: ScreenUtils.getDesignHeight(20.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circle("1", true),
                _line(isDone: true),
                _circle("2", false),
                _line(isDone: false),
                _circle("3", false),
              ],
            ),
          ),
          _isBuyer ? BuyerBody() : SellerBody(),
        ],
      ),
    );
  }

  Widget _circle(String text, bool isDone) {
    return Container(
      decoration: BoxDecoration(
        gradient: PRIMARY_GRADIENT,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(ScreenUtils.getDesignHeight(11.0),),
      child: isDone ? SvgPicture.asset(
        CHECK,
        color: Colors.white,
        height: ScreenUtils.getDesignHeight(9.0),
      ) : Text(
        text,
        style: Theme.of(context).primaryTextTheme.headline1!.copyWith(
          fontSize: 14.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _line({required bool isDone}) {
    return isDone ? Container(
      width: ScreenUtils.getDesignWidth(97.0),
      height: ScreenUtils.getDesignHeight(5.0),
      decoration: BoxDecoration(
        gradient: PRIMARY_GRADIENT,
        borderRadius: BorderRadius.circular(5.0),
      ),
    ) : ProgressAnimation(
      shimmerColor: PRIMARY_GRADIENT.colors.last,
      gradientColor: PRIMARY_GRADIENT.colors.first,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 5.0,
        width: ScreenUtils.getDesignWidth(97.0),
        decoration: BoxDecoration(
          color: Color(0xFF07070B),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

