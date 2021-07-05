import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app-colors.dart';
import 'package:play_hq/helpers/app-fonts.dart';
import 'package:play_hq/helpers/app-screen-utils.dart';

class DiscoverCarouselWidget extends StatelessWidget {
  final String gameName;
  final String gameId;
  final String trailerUrl;
  final String backgroundUrl;
  final String characterUrl;

  DiscoverCarouselWidget(
      {this.gameName,
      this.gameId,
      this.trailerUrl,
      this.backgroundUrl,
      this.characterUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        // container aligned to the bottom of the stack with background
        Positioned(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: ScreenUtils.getDesignHeight(180),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    backgroundUrl,
                  ),
                ),
              ),
            ),
          ),
        ),
        // container aligned to the bottom of the stack with gradient to cover background
        Positioned(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: ScreenUtils.getDesignHeight(180),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.0),
                        Colors.black.withOpacity(0.9),
                      ],
                      )),
            ),
          ),
        ),
        // container which has the text on top of the background
        Positioned(
          child: Padding(
            padding:
                EdgeInsets.only(top: ScreenUtils.getDesignHeight(40), left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                            offset: Offset(
                              0.0,
                              4.0, // vertical, move down 10
                            ),
                          )
                        ],
                        color: PRIMARY_COLOR),
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: Padding(
                      //TODO: onclick play trailer
                      padding: const EdgeInsets.only(left: 5),
                      child: SvgPicture.asset(
                        'assets/icons/play.svg',
                        color: Colors.white,
                        height: 25,
                        width: 25,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    gameName,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: CircularBold),
                  ),
                ),
                // TODO: on click go to game details page
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "View Details",
                    style: TextStyle(
                        color: PRIMARY_COLOR, fontSize: 16, fontFamily: CircularBold),
                  ),
                )
              ],
            ),
          ),
        ),
        // portioned aligned to the bottom with character
        Positioned(
          // if changing right value change the CharacterCliper rightClipAmount to same value as well
          right: -30,
          bottom: 0,
          child: ClipPath(
              // custom clipper used to cut off the left side of the character because stack overflow visible is needed for the top of the character
              clipper: CharacterClipper(rightClipAmount: -30),
              child: Image.asset(
                characterUrl,
                height: ScreenUtils.getDesignHeight(210),
                fit: BoxFit.cover,
              )),
        ),
      ],
    );
    ;
  }
}

// customer clipper to cut the left side of the character

//clip illustration
//  __________________________________________________
// |                                                  |
// |0.0                  size.width - 30, size.height |
// |0. size.height       size.width - 30, 0           |
// |__________________________________________________|
class CharacterClipper extends CustomClipper<Path> {
  final int rightClipAmount;

  CharacterClipper({this.rightClipAmount});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width + rightClipAmount, size.height);
    path.lineTo(size.width + rightClipAmount, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CharacterClipper oldClipper) => false;
}
