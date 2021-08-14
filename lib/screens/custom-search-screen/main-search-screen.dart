import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/widgets/custom-body.dart';


class MainSearchScreen extends StatefulWidget {
  const MainSearchScreen({Key? key}) : super(key: key);

  @override
  _MainSearchScreenState createState() => _MainSearchScreenState();
}

class _MainSearchScreenState extends State<MainSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(
        body: [
          SafeArea(child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'Search',
                    style: Theme.of(context).primaryTextTheme.headline1?.copyWith(fontFamily: Neusa),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    'Find all your favourite games',
                    style: Theme.of(context).primaryTextTheme.headline4?.copyWith(fontFamily: CircularBook , color: Colors.white.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
