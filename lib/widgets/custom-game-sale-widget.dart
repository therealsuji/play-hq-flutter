import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class CustomGameSaleWidget extends StatelessWidget {
  final String? title;
  final String? price;
  final String? soldTo;
  final String? backgroundImage;

  const CustomGameSaleWidget({Key? key, this.title, this.price, this.soldTo, this.backgroundImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtils.getDesignHeight(110),
      decoration: BoxDecoration(color: SubContainerColor, borderRadius: BorderRadius.circular(6)),
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Row(
            children: [
              Container(
                height: ScreenUtils.getDesignHeight(83),
                width: ScreenUtils.getDesignHeight(83),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:NetworkImage(
                          backgroundImage!,
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title!, style: Theme
                        .of(context)
                        .primaryTextTheme
                        .subtitle2, overflow: TextOverflow.ellipsis),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(price!,
                          style: Theme
                              .of(context)
                              .primaryTextTheme
                              .subtitle2!
                              .copyWith(color: Pricetext, fontSize: 12)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        "Sold to : ${soldTo}",
                        style: Theme
                            .of(context)
                            .primaryTextTheme
                            .subtitle2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
,
          Container(
            height: 20,
            width: 20,
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 3),
            decoration: BoxDecoration(color: PRIMARY_COLOR, shape: BoxShape.circle),
            child: SvgPicture.asset(
              'assets/icons/back-arrow.svg',
              color: Colors.white,
              height: 15,
            ),
          ),
        ],
      ),
    );
  }
}
