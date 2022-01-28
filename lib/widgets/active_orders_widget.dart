import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/models/orders_model/orders.dart';

class ActiveOrdersWidget extends StatelessWidget {

  final OrdersModel? orderDetails;

  const ActiveOrdersWidget({Key? key, this.orderDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtils.getDesignHeight(265),
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

              ],
            ),
            Row(
              children: [

              ],
            ),
            Row(
              children: [

              ],
            ),
          ],
        ),
      ),
    );
  }
}