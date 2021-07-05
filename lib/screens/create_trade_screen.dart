import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/models/search_game_model.dart';
import 'package:play_hq/widgets/custom_app_bar_widget.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_loading.dart';
import 'package:play_hq/widgets/game_widget.dart';
import 'package:provider/provider.dart';

class CreateTradeScreen extends StatefulWidget {
  CreateTradeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreateTradeScreenState createState() => _CreateTradeScreenState();
}

class _CreateTradeScreenState extends State<CreateTradeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWidget(
          title: 'Create Trade Request',
        ),
        backgroundColor: BACKGROUND_COLOR,
        body: Container()
    );
  }
}


