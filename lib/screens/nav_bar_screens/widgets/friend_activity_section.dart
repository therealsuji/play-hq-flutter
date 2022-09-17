import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';

class ActivitySectionCard {
  final String? leftSideImageUrl;
  final String? rightSideImageUrl;
  final String? buttonOneText;
  final Function? buttonOneOnTap;
  final String? buttonTwoText;
  final String text;
  ActivitySectionCard({
    this.leftSideImageUrl,
    this.rightSideImageUrl,
    this.buttonOneText,
    this.buttonOneOnTap,
    this.buttonTwoText,
    required this.text,
  });
}

class ActivitySection extends StatelessWidget {
  final String sectionTitle;
  final List<ActivitySectionCard> cardDetails;
  const ActivitySection({Key? key, required this.sectionTitle, required this.cardDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 10,
          ),
          child: CustomTextWidget(
            sectionTitle,
            style: Theme.of(context).primaryTextTheme.headline3,
          ),
        ),
        Container(
          color: MAIN_CONTAINER_COLOR,
          padding: EdgeInsets.only(left: 24, right: 24, top: 20),
          child: Column(
            children: cardDetails
                .map((e) => Column(
                      children: [
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: e.leftSideImageUrl ?? "",
                              errorWidget: (context, url, error) => Container(
                                height: ScreenUtils.getDesignHeight(50),
                                width: ScreenUtils.getDesignHeight(50),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: ExactAssetImage(IMAGE_NOT_AVAILABLE),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  height: ScreenUtils.getDesignHeight(50),
                                  width: ScreenUtils.getDesignHeight(50),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  e.text,
                                  style: Theme.of(context).primaryTextTheme.bodyText2,
                                ),
                              ),
                            ),
                            ...[
                              if (e.rightSideImageUrl != null)
                                CachedNetworkImage(
                                  imageUrl: e.rightSideImageUrl ?? "",
                                  errorWidget: (context, url, error) => Container(
                                    height: ScreenUtils.getDesignHeight(50),
                                    width: ScreenUtils.getDesignHeight(50),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: ExactAssetImage(IMAGE_NOT_AVAILABLE),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      height: ScreenUtils.getDesignHeight(50),
                                      width: ScreenUtils.getDesignHeight(50),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                            ],
                            ...[
                              if (e.buttonOneText != null && e.buttonTwoText != null) ...[
                                CustomButton(
                                  height: ScreenUtils.getDesignHeight(25),
                                  width: ScreenUtils.getDesignWidth(60),
                                  gradient: PRIMARY_GRADIENT,
                                  buttonText: e.buttonOneText!,
                                  textFontSize: 10,
                                  onPressed: () {
                                    if (e.buttonOneOnTap != null) e.buttonOneOnTap!();
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CustomButton(
                                  height: ScreenUtils.getDesignHeight(25),
                                  width: ScreenUtils.getDesignWidth(60),
                                  gradient: PRIMARY_GRADIENT,
                                  buttonColor: PRIMARY_COLOR,
                                  buttonText: e.buttonTwoText!,
                                  textFontSize: 10,
                                ),
                              ]
                            ]
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 20),
                          height: 1.5,
                          color: SUB_TEXT_COLOR,
                          width: double.infinity,
                        )
                      ],
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
