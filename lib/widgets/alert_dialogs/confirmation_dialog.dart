import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmationDialog extends StatelessWidget {

  final Provider? provider;

  ConfirmationDialog({required this.provider});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Confirm'),
      content: Text('Are you sure you want to delete this item?'),
      actions: <Widget>[
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Delete'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
