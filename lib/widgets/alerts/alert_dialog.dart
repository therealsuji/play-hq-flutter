import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';

abstract class CustomAlert {
  AlertDialog showAlert();
}

class CustomAlertImpl extends CustomAlert{
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
  final VoidCallback? onPressed;
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
  CustomAlertImpl({
    required this.context,
    this.id,
    required this.type,
    this.padding,
    this.onPressed,
    this.image,
    this.title = 'sijis',
    this.buttonText,
    this.desc = 'skoskos',
    this.content = const SizedBox(),
    this.closeFunction,
    this.closeIcon,
    this.onWillPopActive = false,
    this.useRootNavigator = true,
  });

  /// Dismisses the alert dialog.
  Future<void> dismiss() async {
    Navigator.of(context, rootNavigator: useRootNavigator).pop();
  }

  AlertDialog _customDialog() {
    return _showAlertBody();
  }

  AlertDialog _showAlertBody() {
    switch (type) {
      case AlertType.SUCCESS:
        return _showSuccessAlert(title, desc, buttonText);
      case AlertType.ERROR:
        return _showErrorAlert(title, desc, onPressed, buttonText);
      case AlertType.CONFIRMATION:
        return _showConfirmationAlert(title, desc, buttonText);
      default:
        return AlertDialog();
    }
  }

  _showConfirmationAlert(title , desc , buttonText){
    return AlertDialog(
      backgroundColor: POPUP_COLOR,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      content: Builder(builder: (context) {
        return Container(
          width: double.infinity,
          height: ScreenUtils.getDesignHeight(180),
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
              Spacer(),
              Container(
                margin: EdgeInsets.only(left: 10 , right: 10),
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => dismiss(),
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: PRIMARY_COLOR),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: Text('Cancel' , style: TextStyle(fontSize: 14 , color: Colors.white),),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: onPressed,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              gradient: ALERT_GRADIENT,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: Text('Delete Game' , style: TextStyle(fontSize: 14 , color: Colors.white),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  _showSuccessAlert(title, desc, buttonText) {
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
                  onPressed: (){
                    dismiss();
                    onPressed!();
                  },
                  child: Container(
                    width: double.infinity,
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

  @override
  AlertDialog showAlert() {
    return _customDialog();
  }
}
