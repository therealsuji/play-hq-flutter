import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';
import 'package:play_hq/widgets/raised_gradient_button_widget.dart';

class OrderListBody extends StatefulWidget {
  const OrderListBody({Key? key}) : super(key: key);

  @override
  _OrderListBodyState createState() => _OrderListBodyState();
}

class _OrderListBodyState extends State<OrderListBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtils.getDesignHeight(22.0),
        left: ScreenUtils.getDesignWidth(24.0),
        right: ScreenUtils.getDesignWidth(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _labelWidget(
            label1: "Order ID",
            value1: "#1276",
            label2: "Order Date",
            value2: "12/12/2020",
          ),
          _divider(),
          _labelWidget(
            label1: "Delivery Date",
            value1: "16/08/2021",
            label2: "Order Type",
            value2: "Game Bundle",
            gradientValue2: PRIMARY_GRADIENT
          ),
          _divider(),
          _labelWidget(
            label1: "Recipient Name",
            value1: "Damsara Perera",
            label2: "Contact No.",
            value2: "0774147787",
          ),
          _divider(),
          _labelWidget(
            label1: "Order Status",
            value1: "Completed",
            label2: "",
            value2: "",
            gradientValue1: GREEN_GRADIENT,
          ),
          _divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivery Information",
                style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                  color: SUB_TEXT_COLOR,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "287/12 Sri Devananda Road Thumbowila, Piliyandala",
                      style: Theme.of(context).primaryTextTheme.headline5!.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          _divider(),
          Padding(
            padding: EdgeInsets.only(
              top: ScreenUtils.getDesignHeight(15.0),
            ),
            child: Text(
              "Seller Details",
              style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtils.getDesignHeight(15.0),
          ),
          _sellerDetails(),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: SizedBox(
              width: double.infinity,
              height: ScreenUtils.getDesignHeight(53.0),
              child: RaisedGradientButton(
                buttonText: "Create Complaint",
                gradient: ALERT_GRADIENT,
                textFontSize: 14.0,
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtils.getDesignHeight(15.0),
          ),
        ],
      ),
    );
  }

  Widget _labelWidget({
    required String label1,
    required String label2,
    required String value1,
    required String value2,
    LinearGradient? gradientValue1,
    LinearGradient? gradientValue2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label1,
              style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                color: SUB_TEXT_COLOR,
              ),
            ),
            gradientValue1 == null ?
            Text(
              value1,
              style: Theme.of(context).primaryTextTheme.headline5!.copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ) : GradientText(
              value1,
              gradient: gradientValue1,
              style: Theme.of(context).primaryTextTheme.headline5!.copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              label2,
              style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                  color: SUB_TEXT_COLOR),
            ),
            gradientValue2 == null ?
            Text(
              value2,
              style: Theme.of(context).primaryTextTheme.headline5!.copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ) : GradientText(
              value2,
              gradient: gradientValue2,
              style: Theme.of(context).primaryTextTheme.headline5!.copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _sellerDetails() {
    return Container(
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 18.0),
        child: Row(
          children: [
            Container(
              height: ScreenUtils.getDesignHeight(58),
              width: ScreenUtils.getDesignWidth(58),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/user.jpg',
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Richard Kenwood', style: Theme.of(context).primaryTextTheme.headline4),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        STAR_ICON,
                        height: 12.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          "4.2 (32)",
                          style: Theme.of(context).primaryTextTheme.headline5,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: ScreenUtils.getDesignWidth(75.0),
              height: ScreenUtils.getDesignHeight(25.0),
              child: RaisedGradientButton(
                buttonText: "Review Seller",
                gradient: PRIMARY_GRADIENT,
                textFontSize: 8.0,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: ScreenUtils.getDesignHeight(1.5),
      margin: EdgeInsets.symmetric(
        vertical: ScreenUtils.getDesignHeight(15.0),
      ),
      width: double.infinity,
      color: SUB_TEXT_COLOR,
    );
  }
}
