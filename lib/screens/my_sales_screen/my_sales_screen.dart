import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/models/common_models/game_model.dart';
import 'package:play_hq/models/sales/sales_model.dart';
import 'package:play_hq/view_models/sales/get_sales/fetch_sales_view_model.dart';
import 'package:play_hq/widgets/custom_app_bar_widget.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

class MySalesScreen extends StatefulWidget {
  const MySalesScreen({Key? key}) : super(key: key);

  @override
  _MySalesScreenState createState() => _MySalesScreenState();
}

class _MySalesScreenState extends State<MySalesScreen> {
  var gamesCOunt = 2;

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
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
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
                    child: CarouselSlider(
                      items: val.fetchActiveSales.map((sale) {
                        return _gameForSaleWidget(salesPayload: sale, index: val.fetchActiveSales.indexOf(sale));
                      }).toList(),
                      options: CarouselOptions(
                        height: ScreenUtils.getDesignHeight(415),
                        viewportFraction: 0.83,
                        disableCenter: true,
                        enableInfiniteScroll: false,
                        initialPage: 0,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
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
    required int index,
  }) {
    return Container(
      // width: ScreenUtils.getDesignWidth(375),
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.only(left: 0 , top: 20 , right: 0),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Container(
        child: Column(
          children: [
            Row(
                children: salesPayload.games.map((saleDetails) {
                  print('Condition Name : ${saleDetails.conditionId}');

              return _gameCard(
                  saleDetails.game, game_conditions.where((element) => element['API_Slug'] == saleDetails.conditionId).first['name']!);
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
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(color: PRIMARY_COLOR),
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
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
                Spacer(),
                Text(
                  "₹ ${salesPayload.games[0].platform}",
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
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    "₹ ${salesPayload.price}",
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
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Text(
                      "DELETE GAME",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline4!
                          .copyWith(color: Colors.red),
                    ),
                  ),
                  CustomButton(
                    buttonText: 'View Details',
                    textFontSize: 12,
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
      margin:
          EdgeInsets.only(right: 2 < 3 ? ScreenUtils.getDesignWidth(15) : 0),
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
