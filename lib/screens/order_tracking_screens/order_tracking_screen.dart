import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/view_models/order_tracking/order_tracking_view_model.dart';
import 'package:play_hq/widgets/custom_body.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/screens/order_tracking_screens/body/buyer_body.dart';
import 'package:play_hq/screens/order_tracking_screens/body/seller_body.dart';
import 'package:play_hq/screens/order_tracking_screens/widgets/progress_animation.dart';
import 'package:provider/provider.dart';

class OrderTrackingScreen extends StatefulWidget {

  final SalesPayload? salesPayload;

  OrderTrackingScreen({this.salesPayload});

  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> with SingleTickerProviderStateMixin {
  late bool _isBuyer;

  @override
  Widget build(BuildContext context) {
    _isBuyer = true;

    return Scaffold(
      body: CustomBody(
        body: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                child: SvgPicture.asset(
                  ARROW_LEFT_ICON,
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
          _isBuyer ? ChangeNotifierProvider.value(
              value: Provider.of<OrderTrackingViewModel>(context),
              builder:(context , _){
                return BuyerBody(salesPayload: widget.salesPayload,);
          }) : SellerBody(),
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
      padding: EdgeInsets.all(
        ScreenUtils.getDesignHeight(11.0),
      ),
      child: isDone
          ? SvgPicture.asset(
              CHECK_ICON,
              color: Colors.white,
              height: ScreenUtils.getDesignHeight(9.0),
            )
          : Text(
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
          color: MAIN_CONTAINER_COLOR,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
