import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/view_models/sales/sales_details/sales_details_view_model.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_textfield_widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';
import 'package:play_hq/widgets/select_game_item_widget.dart';
import 'package:provider/provider.dart';

import '../../../models/sales/sales_payload_model.dart';
import '../../../widgets/custom_game_widget.dart';

class SaleDetailsBottomSheet extends StatelessWidget {
  final SalesPayload? salesPayload;

  SaleDetailsBottomSheet({
    @required this.salesPayload,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtils.getDesignWidth(24.0),
            vertical: ScreenUtils.getDesignHeight(35.0),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: POPUP_COLOR,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Purchase Game",
                style: Theme.of(context).primaryTextTheme.headline3,
              ),
              Container(
                color: PRIMARY_COLOR,
                height: 2,
                margin: EdgeInsets.only(top: 15.0),
              ),
              SizedBox(
                height: ScreenUtils.getDesignHeight(25.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Game Bundle?",
                    style: Theme.of(context).primaryTextTheme.headline3,
                  ),
                  Text(
                    salesPayload!.gameList!.length > 1 ? "No" : "Yes",
                    style: Theme.of(context).primaryTextTheme.headline3!.copyWith(
                          color: PRIMARY_COLOR,
                        ),
                  )
                ],
              ),
              SizedBox(
                height: ScreenUtils.getDesignHeight(25.0),
              ),
              Text(
                "Games",
                style: Theme.of(context).primaryTextTheme.headline3,
              ),
              Container(
                height: ScreenUtils.getDesignHeight(137.0),
                margin: const EdgeInsets.only(top: 10.0),
                child: ListView.separated(
                  itemCount: salesPayload!.gameList!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, idx) {
                    return GamesWidget(
                      title: salesPayload!.gameList?[idx].game.title,
                      subTitle: salesPayload!.gameList?[idx].status,
                      backgroundUrl: salesPayload!.gameList?[idx].game.boxCover,
                      gradient: PRIMARY_GRADIENT,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10.0,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    Row(
                      children: [
                        GradientText("2000.00 LKR",
                            style: Theme.of(context).primaryTextTheme.headline3, gradient: GREEN_GRADIENT),
                        Text(
                          "  (Minimum)",
                          style: Theme.of(context).primaryTextTheme.headline6,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                "Since the seller has made this game negotiable, you can add a price you feel is right for this game",
                style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                      color: Colors.white.withOpacity(0.6),
                    ),
              ),
              CustomTextfieldWidget(
                iconData: DOLLAR_ICON,
                type: TextInputType.number,
                hideText: false,
                onChanged: (val) => Provider.of<SalesDetailsViewModel>(context, listen: false).getPrice(val.toString()),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: CustomButton(
                  onPressed: () => Provider.of<SalesDetailsViewModel>(context, listen: false)
                      .makePurchaseRequest(salesPayload!.saleId.toString()),
                  buttonText: "Request Purchase",
                  gradient: SECONDARY_GRADIENT,
                ),
              )
            ],
          )),
    );
  }
}
