import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/widgets/alerts/alert_requests.dart';
import 'package:play_hq/widgets/alerts/alert_response.dart';
class DialogService {
  Function(AlertRequest)? _showDialogListener;
  Completer<AlertResponse>? _dialogCompleter;
  /// Registers a callback function. Typically to show the dialog
  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
  Future<AlertResponse> showDialog({String? title,
    String? description,
    String? buttonTitle = 'Ok',
    VoidCallback? onPressed,
    AlertType type = AlertType.GENERAL}){
    _dialogCompleter = Completer<AlertResponse>();
    _showDialogListener!(AlertRequest(title: title! , description: description! , alertType: type , buttonTitle: buttonTitle! , onPressed: onPressed) );
    return _dialogCompleter!.future;
  }
  /// Completes the _dialogCompleter to resume the Future's execution call
  void dialogComplete(AlertResponse response) {
    _dialogCompleter!.complete(response);
    _dialogCompleter = null;
  }
}