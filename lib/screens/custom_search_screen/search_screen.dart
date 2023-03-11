import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/widgets/custom_loading_barrier_widget.dart';
import 'package:provider/provider.dart';

import 'package:play_hq/view_models/custom_search/searchable_model.dart';

class SearchScreen extends StatefulWidget {
  final Widget listView;
  final VoidCallback onBackClick;
  SearchScreen({
    Key? key,
    required this.onBackClick,
    required this.listView,
  }) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40), left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _customSearchTextfield(true, widget.onBackClick),
          Container(
            height: 1.5,
            width: ScreenUtils.bodyWidth,
            decoration: BoxDecoration(gradient: PRIMARY_GRADIENT, borderRadius: BorderRadius.circular(5.0)),
          ),
          Consumer<SearchableModel>(
            builder: (_, val, __) {
              switch (val.states) {
                case SearchScreenStates.EMPTY:
                  return Container();
                case SearchScreenStates.LOADING:
                  return CustomLoadingBarrier(path: 'assets/animations/search.json');
                case SearchScreenStates.SUCCESS:
                  return Expanded(
                    child: widget.listView,
                  );
                case SearchScreenStates.NOTHING:
                  return CustomLoadingBarrier(
                    path: 'assets/animations/search-failed.json',
                  );
                case SearchScreenStates.FAILED:
                  return CustomLoadingBarrier(
                    path: 'assets/animations/error.json',
                  );
                default:
                  return Container();
              }
            },
          )
        ],
      ),
    );
  }

  Widget _customSearchTextfield<T>(bool active, VoidCallback backClicked) {
    return TextFormField(
      style: TextStyle(
        color: TEXT_COLOR,
        fontSize: 18,
      ),
      obscureText: false,
      autofocus: true,
      keyboardType: TextInputType.name,
      onChanged: (val) {
        Provider.of<SearchableModel>(context, listen: false).search(val);
      },
      cursorColor: PRIMARY_COLOR,
      decoration: InputDecoration(
        prefixIcon: Container(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: GestureDetector(
            onTap: () => backClicked(),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: SUB_TEXT_COLOR,
            ),
          ),
        ),
        fillColor: Colors.transparent,
        filled: true,
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 16, color: SUB_TEXT_COLOR.withOpacity(0.6)),
        hintText: 'Search Here...',
        contentPadding: EdgeInsets.only(left: 12.0, top: 20, bottom: 20),
      ),
    );
  }
}
