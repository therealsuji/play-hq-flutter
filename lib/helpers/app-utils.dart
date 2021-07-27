extension EnumTransform on List {
  T enumFromString<T>(String value) {
    return firstWhere((type) => type.toString().split('.').last == value, orElse: () => null);
  }
}
