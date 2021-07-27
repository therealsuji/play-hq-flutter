import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class CustomGameSelector extends StatelessWidget {
  final String? gameName;
  final String genre;
  final String? imageUrl;
  final String? releaseDate;
  final int? index;
  final int? selectedIndex;

  CustomGameSelector(
      {this.gameName, this.genre = 'Action', this.imageUrl, this.releaseDate, this.index, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15),
      width: ScreenUtils.getDesignWidth(290),
      height: ScreenUtils.getDesignHeight(170),
      decoration: BoxDecoration(
          color: CONTAINER_COLOR, borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        children: [
          Container(
            width: ScreenUtils.bodyWidth,
            height: ScreenUtils.getDesignHeight(100),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0)),
                  child: Container(
                    width: ScreenUtils.bodyWidth,
                    child: Image.network(
                      imageUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: ScreenUtils.bodyWidth,
                  color: Colors.black.withOpacity(0.6),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 15),
                    child: Text(gameName!,
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: Neusa,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.75),
                                blurRadius: 30.0,
                                // has the effect of softening the shadow
                                spreadRadius: 10.0,
                                // has the effect of extending the shadow
                                offset: Offset(
                                  2.0, // horizontal, move right 10
                                  2.0, // vertical, move down 10
                                ),
                              ),
                            ]))),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
            width: ScreenUtils.bodyWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Genre',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: Neusa,
                              color: PRIMARY_COLOR,
                          ),
                        ),
                      ),
                      Container(
                        height: ScreenUtils.getDesignHeight(10),
                        width: ScreenUtils.getDesignWidth(80),
                        margin: EdgeInsets.only(top: 3),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context , int index){
                          return Text(
                            genre,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                fontFamily: CircularBook,
                                color: Colors.white),
                          );
                        }, separatorBuilder: (BuildContext context , int index){
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 7.5),
                            height: 3,
                            width: 2,
                            decoration: BoxDecoration(
                              color: PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(5.0)
                            ),
                          );
                        },
                            itemCount: 2)
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Platform',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: Neusa,
                              color: PRIMARY_COLOR,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3),
                        child: Text(
                          releaseDate!,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: CircularBook,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: PRIMARY_COLOR),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25 , vertical: 12),
                      child: Text(
                        // TODO : checks if the selected index is equal to the current and makes the text selected or not
                        index != selectedIndex ? 'SELECT GAME' : 'SELECTED',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: Neusa),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}