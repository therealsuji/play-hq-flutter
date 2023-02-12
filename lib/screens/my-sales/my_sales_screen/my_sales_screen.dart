import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/app_colors.dart';
import '../../../helpers/app_constants.dart';
import '../../../helpers/app_screen_utils.dart';
import '../../../helpers/app_strings.dart';
import '../../../models/common_models/game_model.dart';
import '../../../models/sales/sales_payload_model.dart';
import '../../../view_models/sales/get_sales/fetch_sales_view_model.dart';
import '../../../widgets/custom_app_bar_widget.dart';
import '../../../widgets/custom_button_widget.dart';

class MySalesScreen extends StatefulWidget {
  const MySalesScreen({Key? key}) : super(key: key);

  @override
  _MySalesScreenState createState() => _MySalesScreenState();
}

class _MySalesScreenState extends State<MySalesScreen> {
  @override
  void initState() {
    Provider.of<MySalesViewModel>(context, listen: false).fetchAllSales();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        appBar: CustomAppBarWidget(
          title: "My Sales",
          showNotificationIcon: true,
        ),
        body: Consumer<MySalesViewModel>(
          builder: (_, val, __) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Container(
                    color: MAIN_CONTAINER_COLOR,
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Active Sale Items",
                          style: Theme.of(context).primaryTextTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: ScreenUtils.getDesignHeight(385),
                    width: ScreenUtils.bodyWidth,
                    margin: EdgeInsets.only(left: 24),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return _gameForSaleWidget(
                          salesPayload: val.fetchActiveSales[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: ScreenUtils.getDesignWidth(15),
                        );
                      },
                      itemCount: val.fetchActiveSales.length,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _gameForSaleWidget({
    required SalesPayload salesPayload,
  }) {
    return Container(
      width: ScreenUtils.getDesignWidth(326),
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Container(
        width: ScreenUtils.bodyWidth,
        child: Column(
          children: [
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: salesPayload.gameList!.map((saleDetails) {
                  return _gameCard(
                      saleDetails.game,
                      game_conditions
                          .where((element) => element['API_Slug'] == saleDetails.status)
                          .first['name']!);
                }).toList()),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 1.5,
              decoration: BoxDecoration(
                gradient: PRIMARY_GRADIENT,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Purchase Offers",
                  style:
                      Theme.of(context).primaryTextTheme.headline4!.copyWith(color: PRIMARY_COLOR),
                ),
                Spacer(),
                Text(
                  "5 offers",
                  style: Theme.of(context).primaryTextTheme.headline4,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 1.5,
              decoration: BoxDecoration(
                gradient: PRIMARY_GRADIENT,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Platform",
                  style:
                      Theme.of(context).primaryTextTheme.headline4!.copyWith(color: Colors.white),
                ),
                Spacer(),
                Text(
                  " ${platforms.firstWhere((element) => element['id'] == salesPayload.platform)['name']}",
                  style: Theme.of(context).primaryTextTheme.headline4,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style:
                        Theme.of(context).primaryTextTheme.headline4!.copyWith(color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    "LKR ${salesPayload.price}",
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 1.5,
              decoration: BoxDecoration(
                color: SUB_TEXT_COLOR,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Provider.of<MySalesViewModel>(context, listen: false)
                        .deleteSale(salesPayload.saleId ?? ''),
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Text(
                        "DELETE SALE",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline4!
                            .copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                  CustomButton(
                    buttonText: 'View Details',
                    textFontSize: 12,
                    onPressed: () => Navigator.pushNamed(context, MY_SALES_DETAILS_SCREEN,
                        arguments: salesPayload),
                    height: 45,
                    width: ScreenUtils.getDesignWidth(120),
                    gradient: PRIMARY_GRADIENT,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _gameCard(GameModel gameDetails, String condition) {
    return Container(
      height: ScreenUtils.getDesignHeight(120),
      width: ScreenUtils.getDesignWidth(90),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('${gameDetails.boxCover}'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Container(
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
                    '${gameDetails.title}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    '$condition',
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
