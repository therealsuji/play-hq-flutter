import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';

class BillingBody extends StatefulWidget {
  const BillingBody({Key? key}) : super(key: key);

  @override
  _BillingBodyState createState() => _BillingBodyState();
}

class _BillingBodyState extends State<BillingBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtils.getDesignHeight(40.0),
      ),
      child: Column(
        children: [
          Container(
            color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
            child: Column(
              children: [
                SizedBox(
                  height: ScreenUtils.getDesignHeight(15.0),
                ),
                _labelWidget(
                  label: "Bundle Price",
                  value: "3200LKR",
                  gradient: GREEN_GRADIENT,
                ),
                SizedBox(
                  height: ScreenUtils.getDesignHeight(15.0),
                ),
                _labelWidget(
                  label: "Processing Fee",
                  value: "120LKR",
                ),
                SizedBox(
                  height: ScreenUtils.getDesignHeight(15.0),
                ),
                _labelWidget(
                  label: "Delivery Charges",
                  value: "250LKR",
                ),
                SizedBox(
                  height: ScreenUtils.getDesignHeight(15.0),
                ),
              ],
            ),
          ),
          Container(
            color: MAIN_CONTAINER_COLOR,
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtils.getDesignHeight(21.0),
            ),
            child: _labelWidget(
              label: "Total Amount",
              value: "3580LKR",
              gradient: PRIMARY_GRADIENT,
              textStyle: Theme.of(context).textTheme.headline5!.copyWith(
                color: Colors.white,
                fontSize: 14.0
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _labelWidget({required String label, required String value, LinearGradient? gradient, TextStyle? textStyle}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtils.getDesignWidth(24.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: textStyle ?? Theme.of(context).primaryTextTheme.headline6
          ),
          gradient == null ?
          Text(
            value,
            style: Theme.of(context).primaryTextTheme.headline5!.copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ) : GradientText(
            value,
            gradient: gradient,
            style: textStyle ?? Theme.of(context).primaryTextTheme.headline5!.copyWith(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
