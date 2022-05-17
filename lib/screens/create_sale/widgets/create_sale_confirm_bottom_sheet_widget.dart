import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/view_models/sales/create_sale/create_sale_model.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';
import 'package:play_hq/widgets/select_game_item_widget.dart';
import 'package:provider/provider.dart';

class CreateSaleConfirmBottomSheet extends StatelessWidget {
  const CreateSaleConfirmBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<CreateSaleModel>(
          builder: (_, model, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sale Details Confirmation",
                  style: Theme.of(context).primaryTextTheme.headline3,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 25.0),
                  // TODO change the text below
                  child: Text(
                    "We all make mistakes,so just check if you've given all the details accurately",
                    style: Theme.of(context).primaryTextTheme.bodyText2?.copyWith(color: SubheadingText),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Games",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    Text(
                      model.selectedGameList.length.toString(),
                      style: Theme.of(context).primaryTextTheme.headline3!.copyWith(
                            color: PRIMARY_COLOR,
                          ),
                    )
                  ],
                ),
                Container(
                  height: ScreenUtils.getDesignHeight(137.0),
                  margin: const EdgeInsets.only(top: 10.0),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: model.selectedGameList.length,
                      separatorBuilder: (_, __) => SizedBox(width: ScreenUtils.getDesignWidth(15.0)),
                      itemBuilder: (context, idx) {
                        return SelectGameItem(
                          isSelected: false,
                          imageURL: model.selectedGameList[idx].game!.boxCover,
                          titleText: model.selectedGameList[idx].game!.title,
                          subtitleText: model.selectedGameList[idx].status!
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Game Bundle Price",
                        style: Theme.of(context).primaryTextTheme.headline3,
                      ),
                      GradientText(model.price.toString() + " LKR",
                          style: Theme.of(context).primaryTextTheme.headline3, gradient: GREEN_GRADIENT),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Negotiable ?",
                        style: Theme.of(context).primaryTextTheme.headline3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: PRIMARY_COLOR,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          model.isNegotiable ? TICK_MARK_ICON : CROSS_MARK_ICON,
                          color: Colors.white,
                          height: ScreenUtils.getDesignHeight(10.0),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CustomButton(
                    onPressed: () => Provider.of<CreateSaleModel>(context , listen: false).createSale(),
                    buttonText: "Details are Correct",
                    gradient: GREEN_GRADIENT,
                  ),
                )
              ],
            );
          },
        ));
  }
}
