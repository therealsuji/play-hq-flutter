import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/view-models/select-game-types-view-model/select-game-types-model.dart';
import 'package:play_hq/widgets/custom-search-item-widget.dart';
import 'package:provider/provider.dart';

class CustomSearchScreen extends StatefulWidget {

  @override
  _CustomSearchScreenState createState() => _CustomSearchScreenState();
}

class _CustomSearchScreenState extends State<CustomSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
              currentFocus.unfocus();

          },
          child: Container(
            color: BACKGROUND_COLOR,
            child: Column(
              children: [
                _customSearchTextfield(),
                Consumer<SelectGameTypesModel>(
                  builder: (_ , val , __){
                    return ListView.builder(itemBuilder: (context , index){
                      return SearchGameItem();
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customSearchTextfield(){
    return TextFormField(
      style: TextStyle(
        color: TEXT_COLOR,
        fontSize: 18,
      ),
      obscureText: false,
      focusNode: FocusScopeNode().focusedChild,
      keyboardType: TextInputType.name,
      onChanged: (val) => print(val),
      cursorColor: PRIMARY_COLOR,
      decoration: InputDecoration(
        prefixIcon: Container(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: Icon(Icons.search , color: PRIMARY_COLOR,),
        ),
        fillColor: BACKGROUND_COLOR,
        filled: true,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: PRIMARY_COLOR),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: TEXT_COLOR),
        ),
        contentPadding: EdgeInsets.only(left: 12.0 , top: 20 , bottom: 20),
      ),
    );
  }
}
