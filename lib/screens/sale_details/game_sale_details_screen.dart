import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/screens/sale_details/widgets/sale_details_bottom_sheet.dart';
import 'package:play_hq/widgets/custom_app_bar_widget.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_game_widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';
import 'package:provider/provider.dart';

import '../../helpers/app_constants.dart';
import '../../view_models/sales/sales_details/sales_details_view_model.dart';
import '../../widgets/custom_text_widget.dart';

class GameSaleDetailsScreen extends StatefulWidget {
  final SalesPayload? gameSalePayload;

  GameSaleDetailsScreen({this.gameSalePayload});

  @override
  _GameSaleDetailsScreenState createState() => _GameSaleDetailsScreenState();
}

class _GameSaleDetailsScreenState extends State<GameSaleDetailsScreen> {
  int gamesCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: CustomAppBarWidget(
        title: "Sale Details",
        showNotificationIcon: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        height: ScreenUtils.getDesignHeight(140.0),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: widget.gameSalePayload!.gameList!.map((game) {
                            return GamesWidget(
                              title: game.game.title,
                              backgroundUrl: game.game.boxCover,
                              subTitle: game.status == "MINT"
                                  ? "Mint Condition"
                                  : game.status == "VERY_NEW"
                                      ? "Very New"
                                      : "Playable",
                              gradient: GREEN_GRADIENT,
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Sale Price", style: Theme.of(context).primaryTextTheme.headline3),
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text("(x${widget.gameSalePayload!.gameList!.length} Games)",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline4!
                                              .copyWith(color: PRIMARY_COLOR))),
                                  Spacer(),
                                  GradientText(
                                    "${widget.gameSalePayload!.price!.round()} LKR",
                                    gradient: GREEN_GRADIENT,
                                    style: Theme.of(context).primaryTextTheme.headline4,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: PRIMARY_COLOR,
                              ),
                              margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Platform", style: Theme.of(context).primaryTextTheme.headline3),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text("${_getPlatformName(widget.gameSalePayload!.platform!)}",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline4!
                                            .copyWith(color: SUB_TEXT_COLOR))),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: ScreenUtils.getDesignHeight(15), bottom: ScreenUtils.getDesignHeight(15)),
                              color: SUB_TEXT_COLOR,
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Sale Creation Date", style: Theme.of(context).primaryTextTheme.headline3),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text("12/06/2022",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline4!
                                            .copyWith(color: SUB_TEXT_COLOR))),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                              color: SUB_TEXT_COLOR,
                              height: 2,
                            ),
                            _negotiableContainer(),
                            Container(
                                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                                child: CustomTextWidget(
                                  'Seller Details',
                                  isDynamic: false,
                                  style: Theme.of(context).primaryTextTheme.headline3,
                                )),
                            Container(
                              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                              color: PRIMARY_COLOR,
                              height: 2,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Seller Name", style: Theme.of(context).primaryTextTheme.headline3),
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(widget.gameSalePayload!.seller!.displayName ?? 'Not Mentioned',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline4!
                                              .copyWith(color: SUB_TEXT_COLOR))),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Address", style: Theme.of(context).primaryTextTheme.headline3),
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text("${widget.gameSalePayload!.seller!.address ?? "Not mentioned"}",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline4!
                                              .copyWith(color: SUB_TEXT_COLOR))),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Ratings", style: Theme.of(context).primaryTextTheme.headline3),
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                          (widget.gameSalePayload!.seller!.rating ?? "No ratings yet").toString(),
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline4!
                                              .copyWith(color: SUB_TEXT_COLOR))),
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 20),
                                child: CustomButton(
                                  buttonText: 'View Profile',
                                  gradient: PRIMARY_GRADIENT,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.black,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenUtils.getDesignHeight(17.0),
                      horizontal: ScreenUtils.getDesignWidth(24.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: Theme.of(context).primaryTextTheme.headline5!.copyWith(fontFamily: Neusa),
                            ),
                            GradientText("${widget.gameSalePayload!.price!.round()} LKR", gradient: GREEN_GRADIENT)
                          ],
                        ),
                        CustomButton(
                          buttonText: "Buy Now",
                          onPressed: () => _openBottomSheet(widget.gameSalePayload!),
                          gradient: PRIMARY_GRADIENT,
                          width: ScreenUtils.getDesignWidth(110.0),
                          height: ScreenUtils.getDesignHeight(40.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getPlatformName(int platformId) {
    String platformName = "";
    popularConsoles.forEach((platform) {
      if (platform['id'] == platformId) {
        platformName = platform['name'];
      }
    });
    return platformName;
  }

  Widget _negotiableContainer() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Negotiable?", style: Theme.of(context).primaryTextTheme.headline4),
                  Container(
                    decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(7),
                    child: SvgPicture.asset(
                      widget.gameSalePayload!.negotiable! ? TICK_MARK_ICON : CROSS_MARK_ICON,
                      color: Colors.white,
                      height: ScreenUtils.getDesignHeight(10.0),
                    ),
                  )
                ],
              ),
              Container(
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: SUB_TEXT_COLOR,
                ),
                margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sale Price", style: Theme.of(context).primaryTextTheme.headline4),
                    GradientText(
                      "${widget.gameSalePayload!.price!.round()} LKR",
                      gradient: GREEN_GRADIENT,
                      style: Theme.of(context).primaryTextTheme.headline4,
                    )
                  ],
                ),
              ),
              // Text widget for seller details
            ],
          )),
    );
  }

  Future<void> _openBottomSheet(SalesPayload salesPayload) async {
    SalesDetailsViewModel model = Provider.of<SalesDetailsViewModel>(context, listen: false);
    await showModalBottomSheet<void>(
      isDismissible: true,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ChangeNotifierProvider.value(
          value: model,
          child: SaleDetailsBottomSheet(
            salesPayload: salesPayload,
          ),
        );
      },
    );
  }
}
