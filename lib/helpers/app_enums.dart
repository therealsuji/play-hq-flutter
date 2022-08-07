enum EmailValidType { EMAIL_VALID, EMAIL_NOT_VALID, EMAIL_NOT_SET }

enum SocialLogin { GOOGLE, APPLE, FACEBOOK }

enum HttpAction { GET, POST, PUT, PATCH, POST_ENCODED_URL, DELETE }

enum SearchScreenStates { EMPTY, SUCCESS, NOTHING, LOADING, FAILED }

enum SearchType { MAIN_SEARCH, SETUP_PURCHASES, SETUP_SALES , CREATE_SALE}

enum GameType {WISHLIST , LIBRARY}

enum NotificationType {Information, Success, Failure, Warning}

enum PlatformSelection { PlayStation, Xbox, Nintendo }

enum GameCondition { MINT_SEALED, VERY_NEW, KINDA_USED, PLAYABLE }

enum DiscoverCategory { TOP_RATED_GAMES, MOST_ANTICIPATED_GAMES, GAMES_OF_2022 }

enum GameLists {TOP_RATED_GAMES, MOST_ANTICIPATED_GAMES, GAMES_OF_2022}

enum OrderTrack { AWAITING, DELIVERING, RECEIVED }

enum AlertType {CONFIRMATION, SUCCESS, ERROR , GENERAL}

enum SaleOrderType { PURCHASE,SALE }

enum SaleStatus {COMPLETED, ACTIVE, INACTIVE, DISPATCHED, CANCELLED}

enum OrderStatus {COMPLETED, REJECTED, DISPATCHED, ACCEPTED, PLACED, CANCELLED}

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

enum EndedOrderType {
  ORDER_DETAILS,
  BILLING,
  GAME_LIST,
}

extension EndedOrderTypeExtension on EndedOrderType {
  String get name {
    switch (this) {
      case EndedOrderType.ORDER_DETAILS:
        return 'Order Details';
      case EndedOrderType.BILLING:
        return 'Billing';
      case EndedOrderType.GAME_LIST:
        return 'Game List';
      default:
        return "";
    }
  }
}