import 'package:flutter/material.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';

class SaleDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: ScreenUtils.bodyWidth,
                height: ScreenUtils.getDesignHeight(240),
                child: Stack(
                  children: [
                    Container(
                      width: ScreenUtils.bodyWidth,
                      height: ScreenUtils.getDesignHeight(240),
                      child: Image.asset('assets/images/cyberpunk2.jpg',
                          fit: BoxFit.fill),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.6),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(child: Text('Cyperpunk 2077' , style: TextStyle(fontSize: 33 , fontWeight: FontWeight.bold , color: Colors.white , fontFamily: CircularBold),),),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text('GAME DETAILS' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold , color: Primary , fontFamily: Neusa),),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: ScreenUtils.bodyWidth,
                height: ScreenUtils.getDesignHeight(100),
                color: Color(0xff171B23),
                child: Container(
                  margin: EdgeInsets.only(left: 24 , right: 24),
                  child: Row(
                    children: [
                      Container(
                        height: ScreenUtils.getDesignHeight(65),
                        width: ScreenUtils.getDesignWidth(65),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/images/user.jpg',
                            )
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Column(
                          children: [

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
