import '../../helpers/app_strings.dart';

abstract class Failure {
  String? message;
  Duration? duration;
  void Function()? onTap;
}

class NetworkFailure implements Failure {
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

class TimeoutFailure implements Failure {
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

class FormatFailure implements Failure {
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

class HttpFailure implements Failure {
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

class UnknownFailure implements Failure {
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
