import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class SearchGameItem extends StatelessWidget {

  final String imageUrl;
  final String title;
  final String gameCompany;

  SearchGameItem({this.title, this.gameCompany , this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24 , vertical: 20),
          color: BACKGROUND_COLOR,
          child: Row(
            children: [
              Container(
                height: ScreenUtils.getDesignHeight(60),
                width: ScreenUtils.getDesignWidth(60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(child: Text(title , style: TextStyle(fontWeight: FontWeight.w700 , color: TEXT_COLOR , fontFamily: CircularBook , fontSize: 16),),),
                    Container(child: Text(gameCompany , style: TextStyle(fontWeight: FontWeight.w700 , color: PRIMARY_COLOR , fontFamily: Neusa , fontSize: 16),),)
                  ],
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded , color: TEXT_COLOR , size: 25,)
            ],
          ),
        ),
      ],
    );
  }
}
