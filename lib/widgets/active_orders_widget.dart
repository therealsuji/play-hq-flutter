import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/orders_model/orders.dart';

class ActiveOrdersWidget extends StatelessWidget {
  final OrdersModel? orderDetails;

  const ActiveOrdersWidget({Key? key, this.orderDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
              mainAxisAlignment: orderDetails!.games!.length < 3
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.spaceBetween,
              children: orderDetails!.games!.map((game) {
                return _gameCard(game);
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Total Price',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          '${orderDetails!.price}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: Neusa),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Due Date',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          '${orderDetails!.dueDate}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: Neusa),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: PRIMARY_COLOR,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: ScreenUtils.getDesignHeight(40),
                    width: ScreenUtils.getDesignWidth(140),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: PRIMARY_COLOR,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Text(
                        'Track Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context , ORDER_DETAILS_SCREEN),
                    child: Container(
                      height: ScreenUtils.getDesignHeight(40),
                      width: ScreenUtils.getDesignWidth(140),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          gradient: PRIMARY_GRADIENT),
                      child: Center(
                        child: Text(
                          'Order Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gameCard(Game gameDetails) {
    return Container(
      margin: EdgeInsets.only(
          right: orderDetails!.games!.length < 3
              ? ScreenUtils.getDesignWidth(15)
              : 0),
      height: ScreenUtils.getDesignHeight(120),
      width: ScreenUtils.getDesignWidth(90),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('${gameDetails.coverImage}'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Container(
            height: ScreenUtils.getDesignHeight(120),
            width: ScreenUtils.getDesignWidth(90),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
          ),
          Container(
            height: ScreenUtils.getDesignHeight(120),
            width: ScreenUtils.getDesignWidth(90),
            margin: EdgeInsets.symmetric(
                horizontal: ScreenUtils.getDesignHeight(10),
                vertical: ScreenUtils.getDesignHeight(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    '${gameDetails.name}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    '${gameDetails.releaseDate}',
                    style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
