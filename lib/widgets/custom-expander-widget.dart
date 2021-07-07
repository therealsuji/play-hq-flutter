import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/view-models/select-game-types-view-model/select-game-types-model.dart';
import 'package:provider/provider.dart';

class CustomExpanderWidget extends StatelessWidget {

  final double height;
  final Widget widget;
  final IconData iconData;
  final String titleText;
  final String selectedText;
  final bool state;

  CustomExpanderWidget({this.height , this.iconData , this.widget , this.titleText , this.state, this.selectedText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtils.bodyWidth,
      height: height,
      decoration: BoxDecoration(
        color: CONTAINER_COLOR,
      ),
      margin: EdgeInsets.only(top: 25),
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15) , left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Provider.of<SelectGameTypesModel>(context,
                  listen: false)
                  .changeState(Provider.of<SelectGameTypesModel>(context , listen: false).currentState == false ? true : false),
              child: Row(
                children: [
                  Container(
                    child: Text(titleText , style: TextStyle(fontFamily: CircularBook , fontWeight: FontWeight.w500 , color: Colors.white , fontSize: 18),),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Text(selectedText , style: TextStyle(fontSize: 16 , color: PRIMARY_COLOR , fontFamily: CircularBook , fontWeight: FontWeight.w500),),
                  ),
                  Container(
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: PRIMARY_COLOR
                      ),
                      child: Icon(iconData , color: Colors.white,))
                ],
              ),
            ),
            Visibility(
              maintainSize: state,
              maintainState: state,
              visible: state,
              maintainAnimation: state,
              child: Container(
                margin: EdgeInsets.only(top: 15),
                child: widget,
              ),
            )
          ],
        ),
      ),
    );
  }
}
