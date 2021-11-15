import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/services/base_managers/exceptions.dart';

class GeneralException implements PlayHQException {

  GeneralException(this.message, this.type);

  @override
  String? message;

  @override
  ExceptionTypes? type;

  @override
  Duration? duration;

  @override
  void Function()? onTap;

  @override
  String? errorText;

  @override
  String toString() => this.message!;
}

class PlayHQGeneralException implements PlayHQException {

  PlayHQGeneralException({
    this.duration = const Duration(seconds: 3),
    this.errorText,
    this.onTap,
  });

  @override
  Duration? duration;

  @override
  String? message = "";

  @override
  void Function()? onTap;

  @override
  ExceptionTypes? type = ExceptionTypes.REQUEST_ERROR;

  @override
  String? errorText;

  @override
  String toString() => this.errorText ?? this.message!;

}

class PlayHQTimeoutException implements PlayHQException {

  PlayHQTimeoutException({
    this.duration = const Duration(seconds: 3),
    this.errorText,
    this.onTap,
  });

  @override
  Duration? duration;

  @override
  String? message = "Your request has timed out! Please retry";

  @override
  void Function()? onTap;

  @override
  ExceptionTypes? type = ExceptionTypes.TIMEOUT_EXCEPTION;

  @override
  String? errorText;

  @override
  String toString() => this.errorText ?? this.message!;

}

class PlayHQSocketException implements PlayHQException {

  PlayHQSocketException({
    this.duration = const Duration(seconds: 3),
    this.errorText,
    this.onTap,
  });

  @override
  Duration? duration;

  @override
  String? message = "No network connection! Please retry";

  @override
  void Function()? onTap;

  @override
  ExceptionTypes? type = ExceptionTypes.SOCKET_EXCEPTION;

  @override
  String? errorText;

  @override
  String toString() => this.errorText ?? this.message!;

}

