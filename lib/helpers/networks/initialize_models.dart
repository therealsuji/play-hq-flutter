//Decide on the initialization data model based on the return response

class InitializeData {
  static T fromJson<T>(dynamic json) {
    switch (T) {
      case bool:
        return json as T;

      default:
        throw Exception("Unknown class");
    }
  }
}
