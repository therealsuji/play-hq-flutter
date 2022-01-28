import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/orders/active_orders_view_model/active_orders_view_model.dart';
import 'package:play_hq/widgets/active_orders_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

import '../../service_locator.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  @override
  void initState() {
    super.initState();
    context.read<ActiveOrdersViewModel>().fetchActiveOrders();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    'My Orders',
                    isDynamic: false,
                    width: 113,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: Neusa,
                    ),
                  ),
                  CustomTextWidget(
                    'Your orders are displayed here',
                    isDynamic: false,
                    width: 200,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: SUB_TEXT_COLOR,
                      fontFamily: CircularBook,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () => locator<NavigationService>()
                        .pushNamed(NOTIFICATION_SCREEN),
                    child: Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtils.getDesignWidth(30)),
                        child:
                            SvgPicture.asset('assets/icons/notification.svg')),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 11,
                      width: 11,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, gradient: PRIMARY_GRADIENT),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
          decoration: BoxDecoration(
            color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
            borderRadius: BorderRadius.circular(3),
          ),
          height: ScreenUtils.getDesignHeight(40),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Container(
                    width: ScreenUtils.getDesignWidth(75),
                    decoration: BoxDecoration(
                        gradient: PRIMARY_GRADIENT,
                        borderRadius: BorderRadius.circular(3.0)),
                    child: Center(
                      child: Text(
                        'Purchases',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    )),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'Sales',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            children: [_purchases(), _sales()],
          ),
        ),
      ],
    )));
  }

  Widget _purchases() {
    return Column(
      children: [
        Container(
          height: ScreenUtils.getDesignHeight(55),
          width: double.infinity,
          color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: Row(children: [
                CustomTextWidget(
                  'Active Purchases',
                  isDynamic: false,
                  width: ScreenUtils.getDesignWidth(100),
                  style: Theme.of(context).primaryTextTheme.headline2,
                ),
                Container(
                    height: 20,
                    width: 20,
                    margin:
                        EdgeInsets.only(left: ScreenUtils.getDesignWidth(10)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: PRIMARY_GRADIENT,
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    )),
                Spacer(),
              ]),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 24 , right: 24 , top: 15),
            child: Consumer<ActiveOrdersViewModel>(
              builder: (_ , model, __){
                return ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return ActiveOrdersWidget(
                        orderDetails: model.activeOrderList[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: model.activeOrderList.length);
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _sales() {
    return Column(
      children: [],
    );
  }
}
