import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'custom_button_widget.dart';

class ActiveGameSaleWidget extends StatelessWidget {
  final String backgroundUrl;
  final String gameName;
  final String price;
  final String location;
  final String impressions;
  final String impressionsUp;
  final String messages;

  const ActiveGameSaleWidget(
      {Key key,
      this.backgroundUrl,
      this.gameName,
      this.price,
      this.location,
      this.impressions,
      this.impressionsUp,
      this.messages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtils.getDesignHeight(195),
      width: ScreenUtils.getDesignWidth(329),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        backgroundUrl,
                      ))),
            ),
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Positioned(
              top: 30,
              child: Container(
                margin: EdgeInsets.only(left: 9, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      gameName,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          "LKR ${price}",
                          style: Theme.of(context).primaryTextTheme.subtitle2.copyWith(color: Primary),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          location,
                          style: Theme.of(context).primaryTextTheme.subtitle1,
                        )),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: ScreenUtils.getDesignWidth(329),
                height: ScreenUtils.getDesignHeight(78),
                color: SubContainerColor,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Impressions',
                              style: Theme.of(context).primaryTextTheme.subtitle1.copyWith(color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                impressions,
                                style: Theme.of(context).primaryTextTheme.subtitle1.copyWith(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SvgPicture.asset(
                                'assets/icons/arrow-up.svg',
                                color: Pricetext,
                                height: 12,
                              ),
                            ),
                            Text(
                              impressionsUp,
                              style: Theme.of(context).primaryTextTheme.subtitle1.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Text(
                                'Messages',
                                style: Theme.of(context).primaryTextTheme.subtitle1.copyWith(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  messages,
                                  style: Theme.of(context).primaryTextTheme.subtitle1.copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: ScreenUtils.getDesignWidth(77),
                      child: CustomButton(
                        buttonText: "Edit Post",
                        textFontSize: 12,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
