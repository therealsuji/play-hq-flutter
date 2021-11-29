enum EmailValidType { EMAIL_VALID, EMAIL_NOT_VALID, EMAIL_NOT_SET }

enum SocialLogin { GOOGLE, APPLE, FACEBOOK }

enum HttpAction { GET, POST, PUT, PATCH, POST_ENCODED_URL, DELETE }

enum SearchScreenStates { EMPTY, SUCCESS, NOTHING, LOADING, FAILED }

enum SearchGameScreens { SetupPurchase, SetupSales, CreateSales , ProfileWishList , ProfileLibrary }

enum GamePicker {
  PurchaseWishlist,
  SalesLibrary,
  ProfileWishlist,
  ProfileLibrary
}

enum PlatformSelection { PlayStation, Xbox, Nintendo }

enum GameCondition { MINT_SEALED, VERY_NEW, KINDA_USED, PLAYABLE }

enum OrderTrack { AWAITING, DELIVERING, RECEIVED }

enum ExceptionTypes {
  TIMEOUT_EXCEPTION,
  SOCKET_EXCEPTION,
  REQUEST_ERROR,
  AP_ERROR,
  USER_ERROR,
  UNIMPLEMENTED_EXCEPTION,
}

extension ExceptionExtension on ExceptionTypes {
  String get name {
    switch (this) {
      case ExceptionTypes.TIMEOUT_EXCEPTION:
        return 'Timeout Exception';
      case ExceptionTypes.SOCKET_EXCEPTION:
        return 'Socket Exception';
      case ExceptionTypes.REQUEST_ERROR:
        return 'Request Error';
      case ExceptionTypes.AP_ERROR:
        return 'WIFI Error';
      case ExceptionTypes.USER_ERROR:
        return 'User Error';
      case ExceptionTypes.UNIMPLEMENTED_EXCEPTION:
        return 'Unimplemented Exception';
      default:
        return "";
    }
  }
}
