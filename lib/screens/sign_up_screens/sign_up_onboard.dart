import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/blocs/sign_up_bloc.dart';
import 'package:play_hq/constants/onboarding_genre_list.dart';
import 'package:play_hq/constants/onboarding_platform_list.dart';
import 'package:play_hq/helpers/colors.dart';
import 'package:play_hq/helpers/screen_utils.dart';
import 'package:play_hq/models/genre_model.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

class SignUpOnBoard extends StatefulWidget {
  @override
  _SignUpOnBoardState createState() => _SignUpOnBoardState();
}

class _SignUpOnBoardState extends State<SignUpOnBoard> {
  SignUpBloc _signUpBloc;
  PageController mainController = PageController(initialPage: 0);
  List<List<int>> genreIndexList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _signUpBloc = Provider.of<SignUpBloc>(context);
  }

  @override
  void initState() {
    genreIndexList = createGenreList(genreList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(50),
                left: ScreenUtils.getDesignWidth(24),
                right: ScreenUtils.getDesignWidth(24)),
            child: StreamBuilder<int>(
                stream: _signUpBloc.getPagePosition,
                initialData: 0,
                builder: (context, snapshot) {
                  return _pageIndicator(snapshot.data, 5);
                }),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(44),
              ),
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: mainController,
                onPageChanged: (index) => _signUpBloc.setPagePosition.add(index),
                children: [_genreBody(), _platformBody()],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: ScreenUtils.getDesignWidth(24),
                right: ScreenUtils.getDesignWidth(24),
                bottom: ScreenUtils.getDesignWidth(24)),
            child: CustomButton(
              buttonText: "NEXT",
              onPressed: () {
                mainController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              },
            ),
          ),
          StreamBuilder<int>(
              stream: _signUpBloc.getPagePosition,
              initialData: 0,
              builder: (context, snapshot) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtils.getDesignWidth(24),
                      right: ScreenUtils.getDesignWidth(24),
                      bottom: ScreenUtils.getDesignWidth(24)),
                  child: CustomButton(
                    buttonColor: snapshot.data == 0 ? Unselected : Primary,
                    buttonText: "Back",
                    onPressed: snapshot.data == 0
                        ? null
                        : () {
                            mainController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                          },
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget _pageIndicator(int position, int length) {
    var list = [];
    list.length = length;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list.asMap().entries.map((entry) {
        int idx = entry.key;
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(
                left: idx != 0 ? ScreenUtils.getDesignWidth(2) : 0,
                right: idx != length - 1 ? ScreenUtils.getDesignWidth(2) : 0),
            height: ScreenUtils.getDesignHeight(5),
            decoration: BoxDecoration(
                color: idx == position ? Primary : Color(0xffBBB8BB), borderRadius: BorderRadius.circular(10)),
          ),
        );
      }).toList(),
    );
  }

  Widget _genreBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtils.getDesignWidth(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Favorite Genre',
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Select your favorite genre from the following list',
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
              ),
            ],
          ),
        ),
        StreamBuilder<List<int>>(
            stream: _signUpBloc.getGenresSelected,
            builder: (context, snapshot) {
              return Container(
                height: ScreenUtils.getDesignHeight(380),
                child: PageView(
                    onPageChanged: (index) {
                      _signUpBloc.setGenrePagination.add(index);
                    },
                    children: genreIndexList.map((list) => _genrePageViewBody(list)).toList()),
              );
            }),
        Container(
          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(20)),
          alignment: Alignment.center,
          child: StreamBuilder<int>(
              stream: _signUpBloc.getGenrePagination,
              initialData: 0,
              builder: (context, snapshot) {
                return DotsIndicator(
                  dotsCount: (genreList.length / 4).ceil(),
                  position: snapshot.data.toDouble(),
                  decorator: DotsDecorator(
                    size: Size(12, 12),
                    spacing: EdgeInsets.all(4),
                    color: Colors.transparent,
                    activeSize: Size(12, 12),
                    shape: CircleBorder(side: BorderSide(color: Primary, width: 2)),
                    activeColor: Primary,
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _platformBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtils.getDesignWidth(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Favorite Platform',
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Select your favorite platform from the following list',
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
              ),
            ],
          ),
        ),
        StreamBuilder<List<int>>(
            stream: _signUpBloc.getPlatformSelected,
            initialData: [],
            builder: (context, snapshot) {
              return Container(
                  height: ScreenUtils.getDesignHeight(380),
                  child: PageView(
                    onPageChanged: (index) => _signUpBloc.setPlatformPagination.add(index),
                    children: platformList.map((platform) {


                      return Stack(
                        children: [
                          Positioned.fill(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: ScreenUtils.getDesignWidth(40),
                                right: ScreenUtils.getDesignWidth(40),
                              ),
                              child: GestureDetector(
                                  onTap:()=>_signUpBloc.setPlatformSelected.add(platform['id']),
                                  child: Image.asset(platform['image_background'])),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.only(
                                top: ScreenUtils.getDesignWidth(40),
                                right: ScreenUtils.getDesignWidth(40),
                              ),
                              padding:EdgeInsets.all(8),
                              height: ScreenUtils.getDesignWidth(30),
                              width: ScreenUtils.getDesignHeight(30),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child:  snapshot.data.contains(platform['id']) ? SvgPicture.asset('assets/icons/check.svg') : Container(),
                            ),
                          ),
                          Positioned(
                            child: Align(
                              child: Text(
                                platform['name'],
                                style: Theme.of(context).primaryTextTheme.headline1.copyWith(fontSize: 24),
                              ),
                              alignment: Alignment.bottomCenter,
                            ),
                          )
                        ],
                      );
                    }).toList(),
                  ));
            }),
        Container(
          margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(20)),
          alignment: Alignment.center,
          child: StreamBuilder<int>(
              stream: _signUpBloc.getPlatformPagination,
              initialData: 0,
              builder: (context, snapshot) {
                return DotsIndicator(
                  dotsCount: platformList.length,
                  position: snapshot.data.toDouble(),
                  decorator: DotsDecorator(
                    size: Size(12, 12),
                    spacing: EdgeInsets.all(4),
                    color: Colors.transparent,
                    activeSize: Size(12, 12),
                    shape: CircleBorder(side: BorderSide(color: Primary, width: 2)),
                    activeColor: Primary,
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _genrePageViewBody(List<int> genrePos) {
    return Padding(
      padding: EdgeInsets.only(top: ScreenUtils.getDesignHeight(32)),
      child: Center(
        child: StreamBuilder<List<int>>(
            stream: _signUpBloc.getGenresSelected,
            initialData: [],
            builder: (context, snapshot) {
              return Wrap(
                  alignment: WrapAlignment.start,
                  spacing: ScreenUtils.getDesignWidth(15),
                  runSpacing: ScreenUtils.getDesignHeight(15),
                  children: genrePos
                      .map((index) => GestureDetector(
                            onTap: () => _signUpBloc.setGenreSelected.add(index),
                            child: _gridTile(
                              active: _isActive(snapshot.data, index),
                              name: genreList[index]['name'],
                              backgroundUrl: genreList[index]['image_background'],
                            ),
                          ))
                      .toList());
            }),
      ),
    );
  }

  Widget _gridTile({@required String name, @required String backgroundUrl, @required bool active}) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: ScreenUtils.getDesignHeight(156),
            width: ScreenUtils.getDesignWidth(156),
            child: CachedNetworkImage(
              imageUrl: backgroundUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        Positioned.fill(
            child: Container(
                decoration: BoxDecoration(
                    border: active ? Border.all(color: Primary, width: 3) : Border.all(width: 0),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                    gradient:
                        LinearGradient(begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter, colors: [
                      Colors.white.withOpacity(0.0),
                      Colors.black.withOpacity(0.5),
                      Colors.black,
                    ], stops: [
                      0.0,
                      0.5,
                      1.0,
                    ])))),
        Positioned.fill(
          child: Center(
              child: Text(
            name,
            style: Theme.of(context).primaryTextTheme.headline1,
            textAlign: TextAlign.center,
          )),
        ),
        active
            ? Positioned(
                top: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtils.getDesignHeight(5),
                    right: ScreenUtils.getDesignWidth(5),
                  ),
                  height: ScreenUtils.getDesignHeight(28),
                  width: ScreenUtils.getDesignWidth(28),
                  decoration: BoxDecoration(
                    color: Primary,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(ScreenUtils.getDesignHeight(6)),
                    child: SvgPicture.asset(
                      'assets/icons/check.svg',
                      color: Colors.white,
                    ),
                  ),
                ))
            : Positioned(
                top: 0,
                right: 0,
                child: Container(),
              )
      ],
    );
  }

  bool _isActive(List<int> indexList, int currentIndex) {
    bool flag = false;
    for (int x = 0; indexList.length > x; x++) {
      if (indexList[x] == currentIndex) {
        flag = true;
        break;
      }
      flag = false;
    }
    return flag;
  }

  List<List<int>> createGenreList(int genreLength) {
    // [[0,1,2,3],[4,5,6,7]]
    // return a list of indexes paginated by 4
    var currentNumber = 1;
    List<int> page = [];
    List<List<int>> totalPageList = [];
    for (int x = 0; genreLength > x; x++) {
      page.add(x);
      if (currentNumber % 4 == 0) {
        totalPageList.add(page);
        page = [];
      }
      if (x == genreLength - 1) {
        totalPageList.add(page);
      }
      currentNumber++;
    }
    return totalPageList;
  }
}