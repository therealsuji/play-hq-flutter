import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/services/dialog_service.dart';
import 'package:play_hq/widgets/alerts/alert_dialog.dart';
import 'package:play_hq/widgets/alerts/alert_requests.dart';
import 'package:play_hq/widgets/alerts/alert_response.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../service_locator.dart';
class DialogManager extends StatefulWidget {
  final Widget? child;
  DialogManager({Key? key, this.child}) : super(key: key);
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();
  @override
  void initState() {
    _dialogService.registerDialogListener(_showDialog);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  void _showDialog(AlertRequest request) {
    CustomAlert(
        context: context,
        title: request.title,
        desc: request.description,
        type : request.alertType,
        buttonText: request.buttonTitle,
        closeFunction: () =>
            _dialogService.dialogComplete(AlertResponse(confirmed: false)),
        onPressed: request.onPressed).show();
  }
}