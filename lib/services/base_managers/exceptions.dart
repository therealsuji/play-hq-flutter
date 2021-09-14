import 'package:play_hq/helpers/app_enums.dart';

abstract class PlayHQException {
  ExceptionTypes? type;
  String? message;
  String? errorText;
  Duration? duration;
  void Function()? onTap;
}