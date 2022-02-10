import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_hq/widgets/alerts/alert_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Alert {
  final String? id;
  final BuildContext context;
  final AlertType? type;

  /// Alert's Style Object
  /// If there is no style provided, default style will be used.
  final AlertStyle style;
  final Widget? alert;
  final EdgeInsets? padding;
  final Widget? image;
  final String? title;
  final String? desc;
  final Widget content;

  /// Alert dialog's buttons
  /// if there is no button provided and AlertStyle's "isButtonVisible" parameter
  /// is true, default "Cancel" button will be displayed.
  final List<DialogButton>? buttons;
  final Function? closeFunction;
  final Widget? closeIcon;
  final bool onWillPopActive;
  final bool useRootNavigator;
  final AlertAnimation? alertAnimation;

  /// Alert constructor
  ///
  /// [context] is required.
  Alert({
    required this.context,
    this.id,
    this.type,
    this.style = const AlertStyle(),
    this.padding,
    this.image,
    this.title,
    required this.alert,
    this.desc,
    this.content = const SizedBox(),
    this.buttons,
    this.closeFunction,
    this.closeIcon,
    this.onWillPopActive = false,
    this.alertAnimation,
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
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        transitionDuration: style.animationDuration,
        transitionBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
            ) =>
        alertAnimation == null
            ? _showAnimation(animation, secondaryAnimation, child)
            : alertAnimation!(
            context, animation, secondaryAnimation, child));
  }

  /// Dismisses the alert dialog.
  Future<void> dismiss() async {
    Navigator.of(context, rootNavigator: useRootNavigator).pop();
  }

  Widget _customDialog(){
    return alert!;
  }

  /// Shows alert with selected animation
  _showAnimation(animation, secondaryAnimation, child) {
    switch (style.animationType) {
      case AnimationType.fromRight:
        return AnimationTransition.fromRight(
            animation, secondaryAnimation, child);
      case AnimationType.fromLeft:
        return AnimationTransition.fromLeft(
            animation, secondaryAnimation, child);
      case AnimationType.fromBottom:
        return AnimationTransition.fromBottom(
            animation, secondaryAnimation, child);
      case AnimationType.grow:
        return AnimationTransition.grow(animation, secondaryAnimation, child);
      case AnimationType.shrink:
        return AnimationTransition.shrink(animation, secondaryAnimation, child);
      case AnimationType.fromTop:
        return AnimationTransition.fromTop(
            animation, secondaryAnimation, child);
    }
  }
}