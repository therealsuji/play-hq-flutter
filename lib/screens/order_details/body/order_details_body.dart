import 'package:flutter/material.dart';

class GameDetailsBody extends StatefulWidget {
  const GameDetailsBody({Key? key}) : super(key: key);

  @override
  _GameDetailsBodyState createState() => _GameDetailsBodyState();
}

class _GameDetailsBodyState extends State<GameDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text('Order Details'),
          ),
        ],
      ),
    );
  }
}
