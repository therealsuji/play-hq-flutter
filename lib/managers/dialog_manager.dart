import 'package:flutter/material.dart';
import 'package:play_hq/screens/create_sale/widgets/sale_confirm_dialog.dart';
import 'package:play_hq/services/dialog_service.dart';
import 'package:play_hq/widgets/alerts/alert_dialog.dart';

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
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }
  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  void _showDialog() {
    Alert(
        context: context,
        alert: SaleConfirmDialog(),
        closeFunction: () => _dialogService.dialogComplete(),
        ).show();
  }

}