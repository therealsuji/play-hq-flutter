import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:play_hq/blocs/tradingBloc/create_trade_bloc.dart';
import 'package:play_hq/constants/font_string_constants.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:play_hq/widgets/directSelect/direct_select_container.dart';
import 'package:play_hq/widgets/directSelect/direct_select_item.dart';
import 'package:play_hq/widgets/directSelect/direct_select_list.dart';
import 'package:provider/provider.dart';

class CreateTradeScreen extends StatefulWidget {
  CreateTradeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreateTradeScreenState createState() => _CreateTradeScreenState();
}

List<String> _meals = [
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
    "imageUrl":
        "https://images.firstpost.com/wp-content/uploads/large_file_plugin/2018/11/1541061542_redtitle.jpg",
    'genre': 'Action',
    'platform': 'PlayStation 4'
  },
  {
    "name": "Destiny 2",
    "imageUrl":
        "https://assets1.ignimgs.com/2019/09/05/destiny-2-shadowkeep-preorder-1567714014550.jpg?width=1280",
    'genre': 'Action',
    'platform': 'PlayStation 4'
  },
  {
    "name": "Marvels Spider-Man",
    "imageUrl":
        "https://www.purefandom.com/wp-content/uploads/2018/09/Spidey-PS4.jpg",
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

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    CreateTradeBloc _tradeBloc = Provider.of<CreateTradeBloc>(context);

    final appBar = PreferredSize(
        child: Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 40),
          decoration: BoxDecoration(
            color: Background,
          ),
          child: Padding(
              padding: EdgeInsets.only(bottom: 20, top: 20),
              child: Container(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/back.svg'),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Creat Trade Request',
                        style: TextStyle(
                            fontFamily: CircularBold,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    SvgPicture.asset('assets/icons/notification.svg'),
                  ],
                ),
              )),
        ),
        preferredSize: Size.fromHeight(90));

    return Scaffold(
      appBar: appBar,
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
                            fontSize: 18,
                            fontFamily: CircularBold,
                            color: Color(0xffB5BDD5).withOpacity(0.8)))),
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
                Container(
                    margin: EdgeInsets.only(top: 25, bottom: 25),
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('Select Preferred Games',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: CircularBold,
                            color: Color(0xffB5BDD5).withOpacity(0.8)))),
                TypaHeadSearch(),
                GestureDetector(
                    onTap: () => _showScaffold(),
                    child: PlatformSelector(
                        data: _meals, label: "Select Game Platform")),
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
      icons.add(GameSelector(
          _gameList[i]['name'],
          _gameList[i]['genre'],
          _gameList[i]['imageUrl'],
          _gameList[i]['platform'],
          i,
          selectedIndex));
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

class TypaHeadSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ContainerColor,
          borderRadius: BorderRadius.all(Radius.circular(6.0))),
      child: StreamBuilder(builder: (context, snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12, top: 5, bottom: 5),
                  child: TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                        autofocus: true,
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontFamily: CircularBook,
                            fontSize: 18),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 18 , color: Color(0xffB5BDD5).withOpacity(0.4)),
                            hintText: 'Enter Game')),
                    suggestionsCallback: (pattern) async {},
                    itemBuilder: (context, suggestion) {
                      print(suggestion);
                      return ListTile(
                        title: Text("${suggestion.streetName}"),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      Navigator.of(context).push(MaterialPageRoute());
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
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

  GameSelector(this.gameName, this.genre, this.imageUrl, this.platform,
      this.index, this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    CreateTradeBloc _tradeBloc = Provider.of<CreateTradeBloc>(context);
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15),
      width: ScreenUtils.getDesignWidth(290),
      height: ScreenUtils.getDesignHeight(180),
      decoration: BoxDecoration(
          color: ContainerColor, borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        children: [
          Container(
            width: ScreenUtils.bodyWidth,
            height: ScreenUtils.getDesignHeight(100),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0)),
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
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontFamily: CircularBook,
                              color: Colors.white),
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
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontFamily: CircularBook,
                              color: Colors.white),
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
                        borderRadius: BorderRadius.circular(3.0),
                        color: index != selectedIndex ? Unselected : Primary),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        // TODO : checks if the selected index is equal to the current and makes the text selected or not
                        index != selectedIndex ? 'SELECT GAME' : 'SELECTED',
                        style: TextStyle(
                            fontSize: 10,
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

// TODO : Widget for the hold and drag drop-down button
class PlatformSelector extends StatelessWidget {
  final buttonPadding = const EdgeInsets.fromLTRB(0, 8, 0, 0);

  final List<String> data;
  final String label;

  PlatformSelector({@required this.data, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 25),
            alignment: AlignmentDirectional.centerStart,
            child: Text(label,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: CircularBold,
                    color: Color(0xffB5BDD5).withOpacity(0.8)))),
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(top: 3 , bottom: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: SubContainerColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: Expanded(
                    // TODO : Custom List widget
                    // TODO : have to add left radius to container
                    child: DirectSelectList<String>(
                  values: data,
                  defaultItemIndex: 0,
                  itemBuilder: (String value) => getDropDownMenuItem(value),
                  focusedItemDecoration: _getDslDecoration(),
                )),
              ),
              Container(
                  margin: EdgeInsets.only(right: 10), child: _getDropdownIcon())
            ],
          ),
        ),
      ],
    );
  }

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                value,
                style: TextStyle(
                    fontFamily: CircularBook,
                    fontSize: 16,
                    color: Colors.white),
              ));
        });
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Primary),
        top: BorderSide(width: 1, color: Primary),
      ),
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

  Icon _getDropdownIcon() {
    return Icon(
      Icons.unfold_more,
      color: Primary,
    );
  }
}
