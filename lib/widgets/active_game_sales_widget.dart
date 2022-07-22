import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/widgets/raised_gradient_button_widget.dart';
import "package:play_hq/helpers/app_utils.dart";
import 'gradient_text_widget.dart';

class ActiveGameSalesWidget extends StatefulWidget {

  final SalesPayload? salesPayload;

  ActiveGameSalesWidget({
    @required this.salesPayload,
  });

  @override
  _ActiveGameSalesWidgetState createState() => _ActiveGameSalesWidgetState();
}

class _ActiveGameSalesWidgetState extends State<ActiveGameSalesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.getDesignWidth(326),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Positioned(
              child: Container(
            height:ScreenUtils.getDesignHeight(205),
                child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.salesPayload!.gameList![0].game!.boxCover ?? '',)),
          )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
            height:ScreenUtils.getDesignHeight(205),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.1)
                ],
              )
            ),
          )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
            height:ScreenUtils.getDesignHeight(205),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Spacer(),
                _gameDetails(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: ScreenUtils.getDesignWidth(20) , vertical: ScreenUtils.getDesignHeight(7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: widget.salesPayload!.gameList!.map((e) {
                      return Container(
                        width: ScreenUtils.getDesignWidth(92),
                        height: ScreenUtils.getDesignHeight(30),
                        decoration: BoxDecoration(
                            color: MAIN_CONTAINER_COLOR.withOpacity(0.8),
                            border: Border.all(color: PRIMARY_COLOR),
                            borderRadius: BorderRadius.circular(3)
                        ),
                        child: Center(child: Text(e.game!.title ?? '' , textAlign: TextAlign.center , style: TextStyle(fontSize: 9 , color: Colors.white, fontWeight: FontWeight.w600),)),
                      );
                    }).toList()
                  ),
                ),
                Spacer(),
                Container(
                  height: ScreenUtils.getDesignHeight(65.0),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtils.getDesignWidth(15.0),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GradientText(
                            '${widget.salesPayload!.price}',
                            gradient: GREEN_GRADIENT,
                            style: Theme.of(context).primaryTextTheme.headline4,
                          ),
                          Text(
                            platforms.firstWhere((element) => element['id'] == widget.salesPayload!.platform)['name'],
                            style: Theme.of(context).primaryTextTheme.headline4!.copyWith(
                              color: SUB_TEXT_COLOR.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: ScreenUtils.getDesignWidth(33.0),
                        width: ScreenUtils.getDesignWidth(91.0),
                        child: RaisedGradientButton(
                          buttonText: "More Details",
                          gradient: PRIMARY_GRADIENT,
                          textFontSize: 12.0,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _gameDetails(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenUtils.getDesignWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(widget.salesPayload!.gameList!.length > 1 ? '${widget.salesPayload!.gameList![0].game!.title} Bundle' : widget.salesPayload!.gameList![0].game!.title ?? '', isDynamic: true , style: TextStyle(fontSize: 22, shadows: <Shadow>[
            Shadow(
              offset: Offset(0.0, 3.0),
              blurRadius: 10.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ], height: 1.1, fontFamily: Neusa ,fontWeight: FontWeight.bold , color: Colors.white), maxWidth: ScreenUtils.getDesignWidth(160), minWidth: ScreenUtils.getDesignWidth(30),),
          Container(
            margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(3)),
            child: widget.salesPayload!.gameList!.length == 1 ? CustomTextWidget('${DateTime.parse(widget.salesPayload!.gameList![0].game!.releaseDate!).format('dd-MM-yyyy')}', isDynamic: true , style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500 , color: PRIMARY_COLOR, shadows: <Shadow>[
            Shadow(
            offset: Offset(0.0, 3.0),
              blurRadius: 10.0,
              color: Color.fromARGB(255, 0, 0, 0),
            )]), maxWidth: ScreenUtils.getDesignWidth(160), minWidth: ScreenUtils.getDesignWidth(30),) : Container(),
          ),
        ],
      ),
    );
  }
}
