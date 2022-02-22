

import 'package:play_hq/helpers/app_enums.dart';

class AlertRequest {
  final String title;
  final String description;
  final String buttonTitle;
  final AlertType alertType;

  AlertRequest({
    required this.title,
    required this.description,
    required this.buttonTitle,
    required this.alertType,
  });
}