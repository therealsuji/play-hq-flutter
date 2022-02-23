import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/models/sales/sales_model.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/game_picker_details_widget.dart';

class MySalesDetailsScreen extends StatefulWidget {
  final SalesPayload? salesPayload;

  MySalesDetailsScreen({this.salesPayload});

  @override
  _MySalesDetailsScreenState createState() => _MySalesDetailsScreenState();
}

class _MySalesDetailsScreenState extends State<MySalesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        child: Text(
                          'My Sales ID: ${widget.salesPayload?.id}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: ScreenUtils.getDesignHeight(137),
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 30),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: ScreenUtils.getDesignWidth(100),
                          child: GamePickerGames(
                            gameName: widget.salesPayload?.games[index].game.title,
                            backgroundUrl:
                                widget.salesPayload?.games[index].game.boxCover,
                            releaseDate:
                            game_conditions.firstWhere((element) => element['API_Slug'] == widget.salesPayload!.games[0].conditionId)['name']
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 15,
                        );
                      },
                      itemCount: widget.salesPayload?.games.length ?? 0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.salesPayload!.price.round()} \LKR',
                          style: TextStyle(
                            color: Colors.lightGreenAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    height: 1.5,
                    decoration: BoxDecoration(
                      gradient: PRIMARY_GRADIENT,
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
                  // Platform Details
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Platform',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${popularConsoles.firstWhere((element) => element['id'] == widget.salesPayload!.games[0].platform)['name']}",
                          style: TextStyle(
                            color: SUB_TEXT_COLOR,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    height: 1.5,
                    decoration: BoxDecoration(
                        color: SUB_TEXT_COLOR,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
                  // Sale Creation Date
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sale Creation Date',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '12/12/2020',
                          // "${DateFormat('dd MMM yyyy').format(widget.salesPayload!.createdAt)}",
                          style: TextStyle(
                            color: SUB_TEXT_COLOR,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    height: 1.5,
                    decoration: BoxDecoration(
                        color: SUB_TEXT_COLOR,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Negotiable?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: PRIMARY_COLOR,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          widget.salesPayload!.negotiable ? TICK_MARK_ICON : CROSS_MARK_ICON,
                          color: Colors.white,
                          height: ScreenUtils.getDesignHeight(10.0),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: ScreenUtils.getDesignHeight(320),
                    color: Colors.blue,
                  ),
                  CustomButton(buttonText: 'Delete sale' , width: double.infinity, height: 50, buttonColor: Colors.red,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
