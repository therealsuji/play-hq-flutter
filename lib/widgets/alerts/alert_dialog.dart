import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

class CustomAlert {
  final String? id;
  final BuildContext context;

  /// Alert's Style Object
  /// If there is no style provided, default style will be used.
  final AlertType? type;
  final EdgeInsets? padding;
  final Widget? image;
  final String? title;
  final String? desc;
  final String? buttonText;
  final VoidCallback? onTap;
  final Widget content;

  /// Alert dialog's buttons
  /// if there is no button provided and AlertStyle's "isButtonVisible" parameter
  /// is true, default "Cancel" button will be displayed.
  final Function? closeFunction;
  final Widget? closeIcon;
  final bool onWillPopActive;
  final bool useRootNavigator;

  /// Alert constructor
  ///
  /// [context] is required.
  CustomAlert({
    required this.context,
    this.id,
    required this.type,
    this.padding,
    required this.onTap,
    this.image,
    this.title,
    this.buttonText,
    this.desc,
    this.content = const SizedBox(),
    this.closeFunction,
    this.closeIcon,
    this.onWillPopActive = false,
    this.useRootNavigator = true,
  });

  /// Displays defined alert window
  Future<bool?> show() async {
    return await showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext buildContext, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return _customDialog();
        },
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel);
  }

  /// Dismisses the alert dialog.
  Future<void> dismiss() async {
    Navigator.of(context, rootNavigator: useRootNavigator).pop();
  }

  Widget _customDialog() {
    return _showAlertBody(type)!;
  }

  _showAlertBody(type) {
    switch (type) {
      case AlertType.SUCCESS:
        return _showSuccessAlert(title, desc, onTap, buttonText);
      case AlertType.ERROR:
        return _showErrorAlert(title, desc, onTap, buttonText);
    }
  }

  _showSuccessAlert(title, desc, onTap, buttonText) {
    return AlertDialog(
      backgroundColor: POPUP_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      insetPadding: EdgeInsets.zero,
      content: Container(
        height: 100,
        width: double.infinity,
      ),
    );
  }

  _showErrorAlert(title, desc, onTap, buttonText) {
    return AlertDialog(
      backgroundColor: POPUP_COLOR,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      content: Builder(builder: (context) {
        return Container(
          height: ScreenUtils.getDesignHeight(130),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                desc,
                style: TextStyle(
                    color: SUB_TEXT_COLOR,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: Colors.transparent , shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: ScreenUtils.getDesignWidth(40),
                    child: Center(
                      child: Text(
                        buttonText,
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    ),
                  ))
            ],
          ),
        );
      }),
    );
  }
}
