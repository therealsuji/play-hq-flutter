import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/injection_container.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/view_models.dart';
import 'package:play_hq/widgets/custom_body.dart';
import 'package:play_hq/widgets/custom_textfield_widget.dart';
import 'package:provider/provider.dart';

class CustomAddressSearchScreen extends StatefulWidget {
  @override
  _CustomAddressSearchScreenState createState() => _CustomAddressSearchScreenState();
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
                      decoration: BoxDecoration(
                          gradient: PRIMARY_GRADIENT, borderRadius: BorderRadius.circular(5.0)),
                    ),
                    if (value.autoCompleteResults.isEmpty)
                      Container()
                    else
                      Expanded(
                          child: ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    onTap: () {
                                      Provider.of<CustomAddressSearchModel>(context, listen: false)
                                          .addLocation(
                                              value.autoCompleteResults[index].placeId.toString(),
                                              value.autoCompleteResults[index].mainText.toString());
                                    },
                                    child: _customAddress(
                                        value.autoCompleteResults[index].mainText.toString(),
                                        value.autoCompleteResults[index].secondaryText.toString()));
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 15,
                                );
                              },
                              itemCount: value.autoCompleteResults.length))
                  ],
                ),
              );
            },
          )
        ],
      ),
      // floatingActionButton: Container(
      //   margin: EdgeInsets.only(),
      //   height: 60,
      //   width: 60,
      //   child: FloatingActionButton(
      //       child: Container(
      //         height: 100,
      //         child: Icon(Icons.add_location_alt_outlined, color: Colors.white,
      //           size: 27,),
      //         width: 100,
      //         decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             gradient: PRIMARY_GRADIENT
      //         ),
      //       ),
      //       onPressed: () {
      //           locator<NavigationService>().pushNamed(CUSTOM_MAP_SCREEN);
      //       }),
      // ),
    );
  }

  Widget _customAddress(String title, String subtitle) {
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
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).primaryTextTheme.headline4,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            subtitle,
                            overflow: TextOverflow.fade,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline5!
                                .copyWith(color: SUB_TEXT_COLOR),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            width: ScreenUtils.bodyWidth,
            height: 1.5,
            decoration:
                BoxDecoration(color: SUB_TEXT_COLOR, borderRadius: BorderRadius.circular(5.0)),
          )
        ],
      ),
    );
  }
}
