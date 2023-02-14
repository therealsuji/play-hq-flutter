import '../../helpers/app_strings.dart';

abstract class Message {
  String? message;
  Duration? duration;
  void Function()? onTap;
}

class NormalMessage implements Message {
  @override
  Duration? duration;

  @override
  String? message;

  @override
  String toString() => message ?? NO_INTERNET_CONNECTION;

  @override
  void Function()? onTap;

  NormalMessage({this.duration = const Duration(seconds: 1) , this.message});

}

class NetworkFailure implements Message {
  NetworkFailure({this.duration = const Duration(seconds: 2), this.onTap});

  @override
  void Function()? onTap;

  @override
  Duration? duration;

  @override
  String? message;

  @override
  String toString() => message ?? NO_INTERNET_CONNECTION;
}

class TimeoutFailure implements Message {
  TimeoutFailure({this.duration = const Duration(seconds: 2), this.onTap});

  @override
  void Function()? onTap;

  @override
  Duration? duration;

  @override
  String? message;

  @override
  String toString() => TIMEOUT_ERROR;
}

class FormatFailure implements Message {
  FormatFailure({this.duration = const Duration(seconds: 2), this.onTap});

  @override
  void Function()? onTap;

  @override
  Duration? duration;

  @override
  String? message;

  @override
  String toString() => FORMAT_ERROR;
}

class HttpFailure implements Message {
  HttpFailure({this.message, this.duration = const Duration(seconds: 2), this.onTap});

  @override
  void Function()? onTap;

  @override
  Duration? duration;

  @override
  String? message;

  @override
  String toString() => HTTP_ERROR;
}

class UnknownFailure implements Message {
  UnknownFailure({this.message, this.duration = const Duration(seconds: 2), this.onTap});

  @override
  void Function()? onTap;

  @override
  Duration? duration;

  @override
  String? message;

  @override
  String toString() => this.message ?? HTTP_ERROR;
}
