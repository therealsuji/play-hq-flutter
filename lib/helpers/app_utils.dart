import 'package:flutter/foundation.dart';

extension EnumTransform on List {
  T? enumFromString<T>(String value) {
    return firstWhere((type) => describeEnum(type) == value);
  }
}

extension StringExtension on String {
  String capitalize() {
    return this
        .toLowerCase()
        .split(" ")
        .map((word) => word[0].toUpperCase() + word.substring(1, word.length))
        .join(" ");
  }
}
