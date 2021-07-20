import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/widgets/custom-map-setter-widget.dart';
import 'package:play_hq/widgets/custom-game-widget.dart';

class SaleDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
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
                        child: Image.asset('assets/images/cyberpunk2077.jpg',
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
                              child: Text('GAME DETAILS' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold , color: PRIMARY_COLOR , fontFamily: Neusa),),)
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Richard Kenwood' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white),),
                              Text('08 Sales' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold , color: Colors.white.withOpacity(0.6)),)
                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () => _modalBottomSheetMenu(context),
                          child: Container(
                            child: SvgPicture.asset('assets/icons/info.svg' , height: 25.0, width: 25.0,),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25) , left: 24),
                  child: Text('Location' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white.withOpacity(0.8) , fontSize: 18 ,),),
                ),
                Container(
                    margin: EdgeInsets.only(top: 15 , left: 24 , right: 24),
                    child: CustomMapSetterWidget()),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25) , left: 24),
                  child: Text('Sale Details' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white.withOpacity(0.8) , fontSize: 18 ,),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24 , right: 24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                            child: Text('Negotiable' , style: TextStyle(fontWeight: FontWeight.bold , color: Color(0xff9290B1) , fontSize: 16 ,),),
                          ),
                          Spacer(),
                          Container(
                            child: SvgPicture.asset('assets/icons/tick.svg' , height: 15.0, width: 15.0,),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                              child: Text('Platform' , style: TextStyle(fontWeight: FontWeight.bold , color: Color(0xff9290B1) , fontSize: 16 ,),),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                              child: Text('PS4' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 16 , fontFamily: Neusa),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                              child: Text('Condition' , style: TextStyle(fontWeight: FontWeight.bold , color: Color(0xff9290B1) , fontSize: 16 ,),),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                              child: Text('MINT' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 16 , fontFamily: Neusa),),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30) , left: 24 , right: 24),
                  child: Container(
                    height: ScreenUtils.getDesignHeight(40),
                    width: ScreenUtils.bodyWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: PRIMARY_COLOR,
                    ),
                    child: Center(child: Text('BUY NOW (LKR 2500)' , style: TextStyle(fontSize: 16, fontFamily: Neusa , color: Colors.white),)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25) , left: 24),
                  child: Text('People also Viewed' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white.withOpacity(0.8) , fontSize: 18 ,),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15 , left: 24 , right: 24 , bottom: 30),
                  height: ScreenUtils.getDesignHeight(160),
                  width: ScreenUtils.bodyWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Widgets for the Game cover with name and price
                      GamesWidget(
                        gameName: 'Ghost of Tsushima',
                        releaseDate: '4200 LKR',
                        backgroundUrl: 'assets/images/tshushima.jpg',
                      ),
                      GamesWidget(
                        gameName: 'COD Warzone',
                        releaseDate: '2900 LKR',
                        backgroundUrl: 'assets/images/warzone.jpg',
                      ),
                      GamesWidget(
                        gameName: 'Cyberpunk',
                        releaseDate: '2500 LKR',
                        backgroundUrl: 'assets/images/cyberpunk.jpg',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  void _modalBottomSheetMenu(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (builder){
          return new Container(
            height: ScreenUtils.totalBodyHeight*0.75,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Color(0xff171B23),
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30) , left: 24 , right: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Richard Kenwood' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white),),
                                    Text('08 Sales' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold , color: Colors.white.withOpacity(0.6)),)
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Text('MESSAGE' , style: TextStyle(fontSize: 18 , fontFamily: Neusa , color: PRIMARY_COLOR , fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25)),
                          child: Text('Seller Information' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 18 ,),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text('From' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 , color: Color(0xff9290B1) , fontFamily: Neusa),),
                              ),
                              Spacer(),
                              Container(
                                child: Text('Kandy , Sri Lanka' , style: TextStyle(fontSize: 18 , color: Colors.white ),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text('Last Sale' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 , color: Color(0xff9290B1) , fontFamily: Neusa),),
                              ),
                              Spacer(),
                              Container(
                                child: Text('2 Days Ago' , style: TextStyle(fontSize: 18 , color: Colors.white ),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text('Joined on' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 , color: Color(0xff9290B1) , fontFamily: Neusa),),
                              ),
                              Spacer(),
                              Container(
                                child: Text('20/08/2020' , style: TextStyle(fontSize: 18 , color: Colors.white ),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text('Overall Rating' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 18 ,),),
                              ),
                              Spacer(),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Text('5.0' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white , fontFamily: CircularBold),),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 3),
                                        child: Icon(Icons.star , color: Color(0xffFFC107),))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text('Communication' , style: TextStyle(fontWeight: FontWeight.bold , color: Color(0xff9290B1), fontSize: 16 ,),),
                              ),
                              Spacer(),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Text('5.0' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white , fontFamily: CircularBold),),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(bottom: 3),
                                        child: Icon(Icons.star , color: Color(0xffFFC107),))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text('Game Condition' , style: TextStyle(fontWeight: FontWeight.bold , color: Color(0xff9290B1) , fontSize: 16 ,),),
                              ),
                              Spacer(),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Text('5.0' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white , fontFamily: CircularBold),),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(bottom: 3),
                                        child: Icon(Icons.star , color: Color(0xffFFC107),))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text('Timely Delivery' , style: TextStyle(fontWeight: FontWeight.bold , color: Color(0xff9290B1) , fontSize: 16 ,),),
                              ),
                              Spacer(),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Text('5.0' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white , fontFamily: CircularBold),),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(bottom: 3),
                                        child: Icon(Icons.star , color: Color(0xffFFC107),))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
                          child: Row(
                            children: [
                              Container(
                                child: Text('06 Reviews' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 18 ,),),
                              ),
                              Spacer(),
                              Container(
                                child: Text('SEE ALL' , style: TextStyle(fontSize: 16 , fontFamily: Neusa , color: PRIMARY_COLOR , fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(15)),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Gary Simmons' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white),),
                                    Text('Amazing products' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold , color: Colors.white.withOpacity(0.6)),)
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 5),
                                            child: Text('5.0' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white , fontFamily: CircularBold),),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(bottom: 3),
                                              child: Icon(Icons.star , color: Color(0xffFFC107),))
                                        ],
                                      ),
                                    ),
                                    Text('2 Days ago' , style: TextStyle(fontSize: 12 , color: Colors.white.withOpacity(0.6)),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30) , bottom: 30),
                          child: Container(
                            height: ScreenUtils.getDesignHeight(40),
                            width: ScreenUtils.bodyWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              color: PRIMARY_COLOR,
                            ),
                            child: Center(child: Text('SEE FULL PROFILE' , style: TextStyle(fontSize: 16, fontFamily: Neusa , color: Colors.white),)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        }
    );
  }

}
