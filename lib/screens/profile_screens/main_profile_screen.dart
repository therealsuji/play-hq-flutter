

import 'package:flutter/material.dart';

class MainProfileScreen extends StatefulWidget {

  @override
  _MainProfileScreenState createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Icon(Icons.settings),
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Icon(Icons.notifications_none),
              )
            ],
          )
        ],
      ),
    );
  }
}
