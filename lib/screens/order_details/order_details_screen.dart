import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/view_models/view_models.dart' show EndedOrderModel;
import 'package:play_hq/widgets/custom_body.dart';
import 'package:provider/provider.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: CustomBody(
        body: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: SvgPicture.asset(
                  'assets/icons/back.svg',
                  color: Colors.white,
                ),
                onTap: () => Navigator.pop(context),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
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
            height: ScreenUtils.getDesignHeight(40),
            margin: EdgeInsets.only(
              top: ScreenUtils.getDesignWidth(30),
            ),
            decoration: BoxDecoration(
              color: MAIN_CONTAINER_COLOR,
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Selector<EndedOrderModel, EndedOrderType>(
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
        ],
      ),
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
              style: Theme.of(context).primaryTextTheme.headline6!.copyWith(
                fontSize: 10.0,
              ),
            ),
          ),
        ),
        onTap: () => context.read<EndedOrderModel>().setBodyType(type),
      ),
    );
  }
}
