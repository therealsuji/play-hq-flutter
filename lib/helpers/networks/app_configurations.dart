import 'package:flutter/material.dart';

enum Environment{DEV,QA,STAGE}

//Inherited widget to enforce the environment variables
class AppConfig extends InheritedWidget {

  AppConfig
    ({this.environment, Widget child}
    ):super(child: child);

  final Environment environment;

  //
  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}