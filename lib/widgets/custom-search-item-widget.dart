import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/widgets/custom-text-widget.dart';

class SearchGameItem extends StatelessWidget {

  final String? imageUrl;
  final String? title;
  final String? releaseDate;

  SearchGameItem({this.title, this.releaseDate , this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        color: MAIN_CONTAINER_COLOR.withOpacity(0.4),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0)
        ),
        margin: EdgeInsets.symmetric(vertical: 15 , horizontal: 15),
        child: Row(
          children: [
            Container(
              height: ScreenUtils.getDesignHeight(81),
              width: ScreenUtils.getDesignWidth(60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: ScreenUtils.getDesignWidth(180),
                    child: Text(title! , style: TextStyle(fontSize: 18 , fontFamily: Neusa , fontWeight: FontWeight.bold , color: Colors.white),),),
                  Container(
                    width: ScreenUtils.getDesignWidth(80),
                    child: Text(releaseDate == null ? 'Not Mentioned' : releaseDate! , style: TextStyle(fontSize: 18 , fontFamily: Neusa , fontWeight: FontWeight.bold , foreground: Paint()..shader = PRIMARY_GRADIENT_TEXT_COLOR),),),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: ScreenUtils.getDesignHeight(20),
              width: ScreenUtils.getDesignWidth(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: PRIMARY_GRADIENT
              ),
              child: Icon(Icons.arrow_forward_ios_rounded , color: Colors.white , size: 15,),
            ),
          ],
        ),
      ),
    );
  }
}
