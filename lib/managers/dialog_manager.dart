import 'package:flutter/material.dart';

import '../injection_container.dart';
import '../services/dialog_service.dart';
import '../widgets/alerts/alert_dialog.dart';
import '../widgets/alerts/alert_requests.dart';
import '../widgets/alerts/alert_response.dart';

class DialogManager extends StatefulWidget {
  final Widget? child;
  DialogManager({Key? key, this.child}) : super(key: key);
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = sl<DialogService>();
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
            type: request.alertType,
            buttonText: request.buttonTitle,
            closeFunction: () => _dialogService.dialogComplete(AlertResponse(confirmed: false)),
            onPressed: request.onPressed)
        .show();
  }
}
