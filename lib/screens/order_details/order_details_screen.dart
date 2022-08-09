import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/screens/order_details/body/billing_body.dart';
import 'package:play_hq/screens/order_details/body/order_details_body.dart';
import 'package:play_hq/screens/order_details/body/game_list_body.dart';
import 'package:play_hq/view_models/orders/order_details_view_model/order_details_view_model.dart';
import 'package:play_hq/view_models/view_models.dart' show EndedOrderModel;
import 'package:provider/provider.dart';

class OrderDetailsScreen extends StatefulWidget {

  final SalesPayload? salesPayload;

  OrderDetailsScreen({this.salesPayload});

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtils.getDesignHeight(20.0) + ScreenUtils.statusBarHeight
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtils.getDesignWidth(24.0),
                  ),
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      'assets/icons/back.svg',
                      color: Colors.white,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Order ID: #12345',
                    style: Theme.of(context).primaryTextTheme.headline2!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: ScreenUtils.getDesignHeight(40.0),
              margin: EdgeInsets.only(
                top: ScreenUtils.getDesignWidth(30.0),
                left: ScreenUtils.getDesignWidth(24.0),
                right: ScreenUtils.getDesignWidth(24.0),
              ),
              decoration: BoxDecoration(
                color: MAIN_CONTAINER_COLOR,
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: Selector<OrderDetailsViewModel, EndedOrderType>(
                  selector: (_, m) => m.bodyType,
                  builder: (_, bodyType, __) {
                    return Row(
                      children: [
                        _toggleButton(
                          type: EndedOrderType.ORDER_DETAILS,
                          isSelected: EndedOrderType.ORDER_DETAILS == bodyType,
                        ),
                        _toggleButton(
                          type: EndedOrderType.BILLING,
                          isSelected: EndedOrderType.BILLING == bodyType,
                        ),
                        _toggleButton(
                          type: EndedOrderType.GAME_LIST,
                          isSelected: EndedOrderType.GAME_LIST == bodyType,
                        ),
                      ],
                    );
                  }
              ),
            ),
            Expanded(
              child: Selector<OrderDetailsViewModel, EndedOrderType>(
                selector: (_, m) => m.bodyType,
                builder: (_, type, __) {
                  switch (type) {
                    case EndedOrderType.ORDER_DETAILS:
                      return OrderListBody(salesPayload: widget.salesPayload,);
                    case EndedOrderType.BILLING:
                      return BillingBody(salesPayload: widget.salesPayload,);
                    case EndedOrderType.GAME_LIST:
                      return GameDetailsBody(salesPayload: widget.salesPayload,);
                    default:
                      return Container();
                  }
                },
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _toggleButton({
    required EndedOrderType type,
    required bool isSelected,
  }) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            gradient: isSelected ? PRIMARY_GRADIENT : null,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Center(
            child: Text(
              type.name,
              style: Theme.of(context).primaryTextTheme.headline5!
            ),
          ),
        ),
        onTap: () => context.read<OrderDetailsViewModel>().setBodyType(type),
      ),
    );
  }
}
