import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/widgets/custom_game_widget.dart';
import 'package:play_hq/helpers/app_utils.dart';

class ActiveOrdersWidget extends StatelessWidget {
  final SalesPayload salesPayload;

  const ActiveOrdersWidget({Key? key, required this.salesPayload}) : super(key: key);

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
            Wrap(
                spacing: 17,
                children: salesPayload.gameList!.map((game) {
                  return GamesWidget(
                    title: game.game.title,
                    width: ScreenUtils.getDesignWidth(80),
                    height: ScreenUtils.getDesignHeight(130),
                    subTitle: DateTime.parse(game.game.releaseDate!).format('dd-MM-yyyy'),
                    backgroundUrl: game.game.boxCover,
                    gradient: PRIMARY_GRADIENT,
                  );
                }).toList()),
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
                          salesPayload.price.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: Neusa),
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
                          "TODO",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: Neusa,
                          ),
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
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, ORDER_TRACKING_SCREEN, arguments: salesPayload),
                    child: Container(
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
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, ORDER_DETAILS_SCREEN, arguments: salesPayload),
                    child: Container(
                      height: ScreenUtils.getDesignHeight(40),
                      width: ScreenUtils.getDesignWidth(140),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        gradient: PRIMARY_GRADIENT,
                      ),
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
}
