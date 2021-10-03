import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/view_models/sale_details/sale_details_model.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_textfield_widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';
import 'package:play_hq/widgets/select_game_item_widget.dart';
import 'package:provider/provider.dart';

class SaleDetailsBottomSheet extends StatelessWidget {
  const SaleDetailsBottomSheet({Key? key}) : super(key: key);

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
          child: Consumer<SaleDetailsModel>(
            builder: (_, model, __) {
              return Column(
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
                        "Yes",
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
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, idx) {
                        return SelectGameItem(
                            isSelected: false,
                            imageURL: "https://wallpaperaccess.com/thumb/35386.jpg",
                            titleText: "Very Good Condtion",
                            isPrice: true,
                            subtitleText: "Playstation 04");
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: CustomButton(
                      onPressed: () => Navigator.pop(context, true),
                      buttonText: "Request Purchase",
                      gradient: SECONDARY_GRADIENT,
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
}
