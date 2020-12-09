import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:play_hq/blocs/tradingBloc/create_trade_bloc.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:play_hq/models/search_game_model.dart';
import 'package:play_hq/widgets/custom_app_bar_widget.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_loading.dart';
import 'package:play_hq/widgets/directSelect/direct_select_container.dart';
import 'package:play_hq/widgets/directSelect/direct_select_item.dart';
import 'package:play_hq/widgets/directSelect/direct_select_list.dart';
import 'package:play_hq/widgets/game_widget.dart';
import 'package:play_hq/widgets/platform_selector_widget.dart';
import 'package:provider/provider.dart';

class CreateTradeScreen extends StatefulWidget {
  CreateTradeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreateTradeScreenState createState() => _CreateTradeScreenState();
}

List<String> _platforms = [
  "PlayStation 4",
  "Xbox One",
  "Nintendo Switch",
  "Playstation 3",
  "Xbox 360",
];

final List<Map<String, dynamic>> _gameList = [
  {
    "name": "Halo Infinite",
    "imageUrl":
        "https://content.fortune.com/wp-content/uploads/2020/07/Halo-Infinite-Primary-Art-Xbox-Series-X.jpg?resize=1200,600",
    'genre': 'Action',
    'platform': 'Xbox One'
  },
  {
    "name": "Red Dead Redemption",
    "imageUrl": "https://images.firstpost.com/wp-content/uploads/large_file_plugin/2018/11/1541061542_redtitle.jpg",
    'genre': 'Action',
    'platform': 'PlayStation 4'
  },
  {
    "name": "Destiny 2",
    "imageUrl": "https://assets1.ignimgs.com/2019/09/05/destiny-2-shadowkeep-preorder-1567714014550.jpg?width=1280",
    'genre': 'Action',
    'platform': 'PlayStation 4'
  },
  {
    "name": "Marvels Spider-Man",
    "imageUrl": "https://www.purefandom.com/wp-content/uploads/2018/09/Spidey-PS4.jpg",
    'genre': 'Action',
    'platform': 'PlayStation 4'
  },
];

List<String> _genres = ['Action', 'FPS Shooter'];

class _CreateTradeScreenState extends State<CreateTradeScreen> {
  int selectedFoodVariants = 0;
  int selectedPortionCounts = 0;
  int selectedPortionSize = 0;

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
  }

  CreateTradeBloc _tradeBloc;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _tradeBloc = Provider.of<CreateTradeBloc>(context);



    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Create Trade Request',
      ),
      key: scaffoldKey,
      backgroundColor: Background,
      body: Container(
        margin: EdgeInsets.only(top: 25, left: 24, right: 24),
        child: DirectSelectContainer(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('Select Library Game',
                        style: TextStyle(
                            fontSize: 18, fontFamily: CircularBold, color: Color(0xffB5BDD5).withOpacity(0.8)))),
                StreamBuilder<Object>(
                    stream: _tradeBloc.getSelectedIndex,
                    initialData: 30,
                    builder: (context, snapshot) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: getLibraryGames(snapshot.data).map((e) {
                            return e;
                          }).toList(),
                        ),
                      );
                    }),
                GestureDetector(
                    onTap: () => _showScaffold(), child: PlatformSelector(data: _platforms, label: "Select Game Platform")),
                Container(
                    margin: EdgeInsets.only(top: 25, bottom: 25),
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('Select Preferred Games',
                        style: TextStyle(
                            fontSize: 18, fontFamily: CircularBold, color: Color(0xffB5BDD5).withOpacity(0.8)))),
                Container(
                  width: ScreenUtils.bodyWidth,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(margin: EdgeInsets.only(right: 13), child: SelectGameWidget()),
                        StreamBuilder(
                            stream: _tradeBloc.getselectedGame,
                            builder: (context, AsyncSnapshot<List<GameDetails>> snapshot) {
                              return snapshot.hasData
                                  ? Container(
                                      child: Row(
                                        children: snapshot.data.map((e) {
                                          return GamesWidget(
                                              backgroundUrl: e.image, price: e.released, gameName: e.name);
                                        }).toList(),
                                      ),
                                    )
                                  : Container();
                            })
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 25, bottom: 25),
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('Enter Meetup Location',
                        style: TextStyle(
                            fontSize: 18, fontFamily: CircularBold, color: Color(0xffB5BDD5).withOpacity(0.8)))),
                Container(
                  height: ScreenUtils.getDesignHeight(170),
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtils.getDesignWidth(10)),
                  decoration: BoxDecoration(color: BottomNavColor, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AbsorbPointer(
                        absorbing: true,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: ScreenUtils.getDesignHeight(16)),
                          height: ScreenUtils.getDesignHeight(92),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: GoogleMap(
                              mapType: MapType.normal,
                              zoomControlsEnabled: false,
                              initialCameraPosition:
                                  CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 10),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/location.svg'),
                              Padding(
                                padding: EdgeInsets.only(left: ScreenUtils.getDesignWidth(10)),
                                child: Text(
                                  'No 2 6th Lane Colombo 2 ',
                                  style: Theme.of(context).primaryTextTheme.subtitle1,
                                ),
                              )
                            ],
                          ),
                          Container(
                              height: ScreenUtils.getDesignHeight(30),
                              width: ScreenUtils.getDesignWidth(96),
                              child: CustomButton(
                                buttonText: "Set On Map",
                                textFontSize: 14,
                                onPressed: () {},
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    margin:
                        EdgeInsets.only(top: ScreenUtils.getDesignHeight(25), bottom: ScreenUtils.getDesignHeight(25)),
                    width: double.infinity,
                    height: ScreenUtils.getDesignHeight(45),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xff2DC8ED), Color(0xff548AF0)])),
                    child: Center(
                      child: Text(
                        'Create Trade Offer',
                        style: TextStyle(color: Colors.white, fontFamily: Neusa, fontSize: 18),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getLibraryGames(int selectedIndex) {
    List<Widget> icons = [];

    for (int i = 0, j = _gameList.length; i < j; i++) {
      icons.add(GameSelector(_gameList[i]['name'], _gameList[i]['genre'], _gameList[i]['imageUrl'],
          _gameList[i]['platform'], i, selectedIndex));
    }

    return icons;
  }

  void _showScaffold() {
    final snackBar = SnackBar(content: Text('Hold and drag instead of tap'));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Icon _getDropdownIcon() {
    return Icon(
      Icons.unfold_more,
      color: Colors.blueAccent,
    );
  }

  BoxDecoration _getShadowDecoration() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black.withOpacity(0.06),
          spreadRadius: 4,
          offset: new Offset(0.0, 0.0),
          blurRadius: 15.0,
        ),
      ],
    );
  }
}

class SelectGameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CreateTradeBloc _tradeBloc = Provider.of<CreateTradeBloc>(context);
    return DottedBorder(
      strokeWidth: 2,
      color: Color(0xff949AAE),
      borderType: BorderType.RRect,
      dashPattern: [10],
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.0)),
        child: GestureDetector(
          onTap: () {
            showSearch(context: context, delegate: DataSearch(_tradeBloc));
          },
          child: Container(
            padding: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(50),
                bottom: ScreenUtils.getDesignHeight(50),
                left: ScreenUtils.getDesignWidth(24),
                right: ScreenUtils.getDesignWidth(24)),
            child: Column(
              children: [
                Container(
                  height: ScreenUtils.getDesignHeight(30),
                  width: ScreenUtils.getDesignWidth(30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Primary,
                  ),
                  child: Center(
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Select Game',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14, fontFamily: Neusa),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final CreateTradeBloc _tradeBloc;

  DataSearch(this._tradeBloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
        primaryColor: Color(0xff171B23),
        primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
        primaryTextTheme: theme.textTheme.copyWith(headline2: TextStyle(color: Colors.white)),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: Theme.of(context).textTheme.title.copyWith(color: Colors.white.withOpacity(0.6)),
        ));
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print('Query ' + query);
    _tradeBloc.setGameName.add(query);

    return StreamBuilder(
        stream: _tradeBloc.getGameData,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Container(
                  color: Background,
                  child: Provider(
                    create: (context) => _tradeBloc,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _tradeBloc.setSelectedGame.add(snapshot.data[index]);
                            close(context, null);
                          },
                          child: ListTile(
                              leading: Icon(
                                Icons.videogame_asset,
                                color: Colors.white,
                              ),
                              title: Text(
                                snapshot.data[index].name,
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              )),
                        );
                      },
                      itemCount: snapshot.data.length,
                    ),
                  ),
                )
              : LoadingBarrier();
        });
  }
}

// TODO : Gets the games that are in the game library
class GameSelector extends StatelessWidget {
  final String gameName;
  final String genre;
  final String imageUrl;
  final String platform;
  final int index;
  final int selectedIndex;

  GameSelector(this.gameName, this.genre, this.imageUrl, this.platform, this.index, this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    CreateTradeBloc _tradeBloc = Provider.of<CreateTradeBloc>(context);
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15),
      width: ScreenUtils.getDesignWidth(290),
      height: ScreenUtils.getDesignHeight(180),
      decoration: BoxDecoration(color: ContainerColor, borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        children: [
          Container(
            width: ScreenUtils.bodyWidth,
            height: ScreenUtils.getDesignHeight(100),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
                  child: Container(
                    width: ScreenUtils.bodyWidth,
                    child: Image.network(
                      imageUrl,
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
                    margin: EdgeInsets.only(left: 10),
                    child: Text(gameName,
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: CircularBold,
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
            margin: EdgeInsets.only(left: 10, right: 10),
            width: ScreenUtils.bodyWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Genre',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: Neusa,
                              color: Primary,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          genre,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14, fontFamily: CircularBook, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
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
                              color: Primary,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          platform,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14, fontFamily: CircularBook, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _tradeBloc.setSelectedItemIndex.add(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0), color: index != selectedIndex ? Unselected : Primary),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        // TODO : checks if the selected index is equal to the current and makes the text selected or not
                        index != selectedIndex ? 'SELECT GAME' : 'SELECTED',
                        style: TextStyle(
                            fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: Neusa),
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
