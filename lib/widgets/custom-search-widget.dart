import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/view-models/select-game-types-view-model/select-game-types-model.dart';
import 'package:play_hq/widgets/custom-loading-barrier-widget.dart';
import 'package:provider/provider.dart';

class DataSearch extends SearchDelegate<String> {

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

    return Consumer<SelectGameTypesModel>(
        builder: (_, snapshot , __) {
          return Container(
            color: BACKGROUND_COLOR,
            child: Provider(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      close(context, null);
                    },
                    child: ListTile(
                        leading: Icon(
                          Icons.videogame_asset,
                          color: Colors.white,
                        ),
                        title: Text(
                          'text',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                  );
                },
              ),
            ),
          );
        });
  }
}
