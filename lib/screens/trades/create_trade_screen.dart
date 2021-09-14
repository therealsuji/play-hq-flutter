import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/models/search_model/app_search_game_model.dart';
import 'package:play_hq/widgets/custom_app_bar_widget.dart';
import 'package:play_hq/widgets/custom_game_selector.dart';

class CreateTradeScreen extends StatefulWidget {
  CreateTradeScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _CreateTradeScreenState createState() => _CreateTradeScreenState();
}

class _CreateTradeScreenState extends State<CreateTradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWidget(
          title: '',
        ),
        backgroundColor: BACKGROUND_COLOR,
        body: Container(
          margin: EdgeInsets.only(left: 24 , right: 24 , top: ScreenUtils.getDesignHeight(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create a Trade Offer' , style: TextStyle(fontSize: 26 , fontWeight: FontWeight.bold , color: Colors.white),),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Make a trade of one of your own games with a game of \nyour preferance' , style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 16 , fontFamily: CircularBook , color: Colors.white.withOpacity(0.6)),),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
                child: Text('Select Library Game' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: Colors.white),),
              ),
              FutureBuilder(
                future: Hive.openBox('libraryGames'),
                builder: (BuildContext context , AsyncSnapshot snapshot){
                  if (snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasError){
                      return Text(snapshot.error.toString());
                    }else{
                      final libraryGamesBox = Hive.box('libraryGames');
                      return Container(
                        height: ScreenUtils.getDesignHeight(190),
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: libraryGamesBox.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index){
                            final libraryGame = libraryGamesBox.getAt(index) as GameDetails;
                            return CustomGameSelector(
                              gameName: libraryGame.name,
                              releaseDate: libraryGame.released,
                              imageUrl: libraryGame.image,
                            );
                        }, separatorBuilder: (BuildContext context , int index){
                          return SizedBox(width: 15,);
                        },
                        ),
                      );
                    }
                  }else{
                    return Text(snapshot.connectionState.toString());
                  }
                },
              )
            ],
          ),
        )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
    super.dispose();
  }

}


