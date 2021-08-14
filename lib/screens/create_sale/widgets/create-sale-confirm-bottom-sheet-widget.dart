import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app-assets.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-utils.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/view-models/create-sale/create-sale-model.dart';
import 'package:play_hq/widgets/custom-button-widget.dart';
import 'package:play_hq/widgets/select-game-item-widget.dart';
import 'package:provider/provider.dart';

class CreateSaleConfirmBottomSheet extends StatelessWidget {
  const CreateSaleConfirmBottomSheet({Key? key}) : super(key: key);

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
                        "0" + model.gameList.length.toString(),
                        style: Theme.of(context).primaryTextTheme.headline3!.copyWith(
                              color: PRIMARY_COLOR,
                            ),
                      )
                    ],
                  ),
                  Container(
                    height: ScreenUtils.getDesignHeight(137.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: ListView.builder(
                        itemCount: model.gameList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, idx) {
                          return SelectGameItem(
                            isSelected: false,
                            imageURL: model.gameList[idx].boxImage,
                            centerText: model.gameList[idx].title,
                            titleText: model.consoleList
                                .firstWhere((console) => console['id'] == model.gameList[idx].platform!.id)['name'],
                            subtitleText: model.gameList[idx].gameCondition.replaceAll("_", " ").capitalize(),
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
                        ShaderMask(
                          shaderCallback: (bounds) => GREEN_GRADIENT.createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                          child: Text(
                            model.price.toString() + " LKR",
                            style: Theme.of(context).primaryTextTheme.headline3,
                          ),
                        ),
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
                    padding: const EdgeInsets.only(top: 25.0),
                    child: CustomButton(
                      onPressed: model.createSale,
                      buttonText: "Details are Correct",
                      gradient: GREEN_GRADIENT,
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
}
