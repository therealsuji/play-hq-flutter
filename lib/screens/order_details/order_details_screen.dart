import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_body.dart';

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
              children: [
                SvgPicture.asset(
                  'assets/icons/back.svg',
                  color: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    'Order ID: #12345',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: ScreenUtils.getDesignHeight(40),
              margin: EdgeInsets.only(top: ScreenUtils.getDesignWidth(30)),
              decoration: BoxDecoration(
                  color: MAIN_CONTAINER_COLOR,
                  borderRadius: BorderRadius.circular(3.0)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: PRIMARY_GRADIENT,
                            borderRadius: BorderRadius.circular(3.0)),
                        child: Center(
                          child: Text(
                            'Order Details',
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
                          'Billing',
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
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Game List',
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

          ],
        ));
  }

}
