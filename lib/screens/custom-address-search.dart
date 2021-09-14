import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';
import 'package:play_hq/service-locator.dart';
import 'package:play_hq/helpers/app-strings.dart';
import 'package:play_hq/services/nav-service.dart';
import 'package:play_hq/view-models/custom-address-search/custom-address-search-model.dart';
import 'package:play_hq/view-models/onboarding/setup-sales-account-view-model/sales-account-model.dart';
import 'package:play_hq/widgets/custom-body.dart';
import 'package:play_hq/widgets/custom-textfield-widget.dart';
import 'package:provider/provider.dart';

class CustomAddressSearchScreen extends StatefulWidget {
  @override
  _CustomAddressSearchScreenState createState() =>
      _CustomAddressSearchScreenState();
}

class _CustomAddressSearchScreenState extends State<CustomAddressSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(
        paddingLeft: 24,
        paddingRight: 24,
        paddingBottom: 40,
        paddingTop: 40,
        body: [
          Consumer<CustomAddressSearchModel>(
            builder: (_, value, __) {
              return Container(
                height: ScreenUtils.totalBodyHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextfieldWidget(
                      iconData: Icons.location_on_outlined,
                      hideText: false,
                      type: TextInputType.text,
                      onChanged: (val) => value.setFormStatus(val),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      width: ScreenUtils.bodyWidth,
                      height: 1.5,
                      decoration: BoxDecoration(gradient: PRIMARY_GRADIENT,
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    if (value.autoCompleteResults.isEmpty) Container() else Expanded(
                        child: ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {
                                    Provider.of<SetupSalesModel>(context ,listen: false).addLocation(value.autoCompleteResults[index].mainText.toString());
                                  },
                                  child: _customAddress(value.autoCompleteResults[index].mainText.toString(), value.autoCompleteResults[index].secondaryText.toString()));
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: 15,);
                            }, itemCount: value.autoCompleteResults.length))
                  ],
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(),
        height: 60,
        width: 60,
        child: FloatingActionButton(
            child: Container(
              height: 100,
              child: Icon(Icons.add_location_alt_outlined, color: Colors.white,
                size: 27,),
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: PRIMARY_GRADIENT
              ),
            ),
            onPressed: () {
                locator<NavigationService>().pushNamed(CUSTOM_MAP_SCREEN);
            }),
      ),
    );
  }

  Widget _customAddress(String title, String subtitle){
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: ScreenUtils.getDesignHeight(37),
                width: ScreenUtils.getDesignWidth(37),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    color: SUB_TEXT_COLOR,
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  Icons.location_on_outlined,
                  color: SUB_TEXT_COLOR,
                  size: 25,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title , style: TextStyle(color: SUB_TEXT_COLOR , fontSize: 14 , fontFamily: CircularBook , fontWeight: FontWeight.bold),),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(subtitle , style: TextStyle(color: SUB_TEXT_COLOR.withOpacity(0.4) , fontSize: 12 , fontFamily: CircularBook , fontWeight: FontWeight.w500),))
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            width: ScreenUtils.bodyWidth,
            height: 1.5,
            decoration: BoxDecoration(
              color: SUB_TEXT_COLOR,
              borderRadius: BorderRadius.circular(5.0)
            ),
          )
        ],
      ),
    );
  }
}
