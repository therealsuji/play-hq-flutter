import 'package:flutter/widgets.dart';

import '../models/errors/exceptions.dart';
import '../widgets/snackbars/custom_flushbar.dart';
import 'base_managers/error_manager.dart';
import 'nav_service.dart';

class ErrorService extends ErrorManager {
  final NavigationService navigationService;

  ErrorService(this.navigationService);

  void showError(Message failure, [Icon? icon, VoidCallback? onRetry]) {
    final context = navigationService.navigatorKey.currentState!.overlay!.context;
    final DisplayError handler = DisplayImpl();
    handler.showResponse(context, failure, icon, onRetry);
  }
}
