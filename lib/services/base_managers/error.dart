import 'package:flutter/widgets.dart';

import '../../models/errors/exceptions.dart';

abstract class ErrorManager {
  void showError(Failure failure, [Icon? icon, VoidCallback? onRetry]);
}
