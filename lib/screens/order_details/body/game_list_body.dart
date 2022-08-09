import 'package:flutter/material.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';

import '../../../widgets/custom_search_item_widget.dart';

class GameDetailsBody extends StatefulWidget {

  final SalesPayload? salesPayload;

  GameDetailsBody({this.salesPayload});

  @override
  _GameDetailsBodyState createState() => _GameDetailsBodyState();
}

class _GameDetailsBodyState extends State<GameDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0 , horizontal: 24),
      child: ListView.separated(itemBuilder: (BuildContext context , int index){
        return SearchGameItem(
          releaseDate: widget.salesPayload!.gameList![index].game.releaseDate!.substring(0, 4),
          title: widget.salesPayload!.gameList![index].game.title,
          imageUrl: widget.salesPayload!.gameList![index].game.boxCover
        );
      }, separatorBuilder: (BuildContext context , int index){
        return SizedBox(height: 0,);
      }, itemCount: widget.salesPayload!.gameList!.length)
    );
  }
}
