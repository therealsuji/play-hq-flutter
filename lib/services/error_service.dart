import 'dart:developer';

import 'package:flutter/widgets.dart';

import '../models/errors/exceptions.dart';
import '../widgets/custom_snackbar.dart';
import 'base_managers/error.dart';
import 'nav_service.dart';

class ErrorService extends ErrorManager {
  final NavigationService navigationService;

  ErrorService(this.navigationService);

  void showError(Failure failure, [Icon? icon, VoidCallback? onRetry]) {
    final context = navigationService.navigatorKey.currentState!.overlay!.context;
    final DisplayError handler = DisplayImpl();
    log(failure.message ?? "LOL");
    handler.showError(context, failure, icon, onRetry);
  }
}
