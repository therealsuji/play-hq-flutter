import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:provider/provider.dart';

class SelectGamesScreen extends StatefulWidget {
  @override
  _SelectGamesScreenState createState() => _SelectGamesScreenState();
}

class _SelectGamesScreenState extends State<SelectGamesScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: BACKGROUND_COLOR,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(90) , left: ScreenUtils.getDesignWidth(24) , right: ScreenUtils.getDesignWidth(24)),
              child: Text('Let\'s get Started' , style: TextStyle(fontWeight: FontWeight.w500 , color: Colors.white , fontSize: 30 , fontFamily: Neusa),),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(5) , left: ScreenUtils.getDesignWidth(24) , right: ScreenUtils.getDesignWidth(24)),
              child: Text('Select what kind of games you like' , style: TextStyle(fontWeight: FontWeight.w500 , color: Colors.white.withOpacity(0.6) , fontSize: 18 , fontFamily: CircularBook),),
            ),
            StreamBuilder<Object>(
              initialData: false,
              builder: (context, snapshot) {
                return snapshot.data ? _selectedGameContainer('Genre' , 35)  : _selectingGamesContainer('Genre' , 35);
              }
            ),
            _selectingGamesContainer('Platform' , 20),
            _selectingGamesContainer('Year' , 20),
          ],
        ),
      ),
    );
  }

  Widget _selectedGameContainer(String title , double margin){
    return Container(
      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(margin)),
      height: ScreenUtils.getDesignHeight(200),
      width: double.infinity,
      decoration: BoxDecoration(
        color: CONTAINER_COLOR,
      ),
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(left: ScreenUtils.getDesignWidth(24) , right: ScreenUtils.getDesignWidth(24) , top: ScreenUtils.getDesignHeight(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(title , style: TextStyle(fontSize: 18 , fontFamily: CircularBold , color: Colors.white , fontWeight: FontWeight.bold),),
              ),
              Spacer(),
              Container(height: 22,width: 22,decoration: BoxDecoration(color: PRIMARY_COLOR , shape: BoxShape.circle),child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5 , vertical: 5),
                  child: SvgPicture.asset('assets/icons/arrow-up.svg' , color: Colors.white)) ,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectingGamesContainer(String title , double margin){
    return Container(
      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(margin)),
      height: ScreenUtils.getDesignHeight(50),
      width: double.infinity,
      decoration: BoxDecoration(
        color: CONTAINER_COLOR,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(left: ScreenUtils.getDesignWidth(24) , right: ScreenUtils.getDesignWidth(24)),
          child: Row(
            children: [
              Container(
                child: Text(title , style: TextStyle(fontSize: 18 , fontFamily: CircularBold , color: Colors.white , fontWeight: FontWeight.bold),),
              ),
              Spacer(),
              Container(height: 22,width: 22,decoration: BoxDecoration(color: PRIMARY_COLOR , shape: BoxShape.circle),child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5 , vertical: 5),
                  child: SvgPicture.asset('assets/icons/arrow-down.svg' , color: Colors.white)) ,)
            ],
          ),
        ),
      ),
    );
  }
}
