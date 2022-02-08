import 'package:play_hq/helpers/app_enums.dart';

class SearchArguments{

  final SearchGameScreens states;
  final bool? isPlatform;

  SearchArguments({required this.states, this.isPlatform = true});

}