import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/models/game_details_models/game_screenshot_modal.dart';
class CustomImageSlider extends StatefulWidget{
  final List<Result>? listImagesModel;
  final int? current;

  const CustomImageSlider({this.listImagesModel, this.current });
  @override
  _CustomImageSliderState createState() =>  _CustomImageSliderState();
}
class _CustomImageSliderState extends State<CustomImageSlider>  {
  int _current = 0;
  bool _stateChange = false;
  @override
  void initState() {
    super.initState();
  }
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    _current = (_stateChange == false) ? widget.current! : _current;
    return new Container(
        color: Colors.transparent,
        child: new Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              //title: const Text('Transaction Detail'),
            ),
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: false,
                        height: MediaQuery.of(context).size.height/1.3,
                        viewportFraction: 1.0,
                        onPageChanged: (index, data) {
                          setState(() {
                            _stateChange = true;
                            _current = index;
                          });
                        },
                        initialPage: widget.current!
                    ),
                    items:  map<Widget>(widget.listImagesModel!, (index, Result url) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                child: CachedNetworkImage(
                                  imageUrl: url.image,
                                )
                              ),
                            )
                          ]
                      );
                    }),

                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(widget.listImagesModel!, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 9.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (_current == index) ? Colors.redAccent : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            )
        )
    );
  }

}