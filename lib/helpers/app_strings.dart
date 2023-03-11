// String constants for the routes in the application
const String SPLASH_SCREEN = '/';
const String HOME_SCREEN = 'home';
const String SIGN_UP_SCREEN = 'signup';
const String PURCHASE_ACCOUNT_SCREEN = 'setupPurchase';
const String SALES_ACCOUNT_SCREEN = 'setupSales';
const String MAIN_SCREEN = 'main';
const String FRIENDS_SEARCH = 'friendsSearch';
const String GAME_DETAILS_SCREEN = 'gamedetails';
const String LANDING_PAGE_SCREEN = 'landingpage';
const String CREATE_TRADE_SCREEN = 'createTrade';
const String GAMES_FOR_SALE_ROUTE = 'gamesforsale';
const String CREATE_SALE_ROUTE = 'createsale';
const String MY_SALES_ROUTE = 'mySale';
const String BUY_GAMES_ROUTE = 'buyGames';
const String SALE_DETAILS_ROUTE = 'saleDetails';
const String SETUP_PURCHASE_ACCOUNT_ROUTE = 'setupPurchase';
const String SETUP_SALES_ACCOUNT_ROUTE = 'setupSales';
const String ORDER_TRACKING_SCREEN = 'orderTrackingScreen';
const String PAYMENT_SCREEN = 'paymentScreen';
const String CUSTOM_ADDRESS_SEARCH_SCREEN = 'customAddressSearchScreen';
const String CUSTOM_MAP_SCREEN = 'customMapScreen';
const String AUTH_SCREEN = 'authenticationScreen';
const String MAIN_ONBOARDING = "onboarding";
const String SETTINGS_SCREEN = 'settings';
const String NOTIFICATION_SCREEN = 'notification';
const String ORDERS_SCREEN = 'orders';
const String ORDER_DETAILS_SCREEN = 'orderDetails';
const String BUY_GAMES_SCREEN = 'buyGames';
const String MY_SALES_DETAILS_SCREEN = 'mysaleDetails';
const String GAME_LIST_SCREEN = 'gameListScreen';
const String GAME_SALE_DETAILS_SCREEN = 'gameSaleDetails';
const String USER_PROFILE_SCREEN = 'profileScreen';

// Search Screens
const String MAIN_SEARCH_SCREEN = 'mainSearchScreen';

// Error Messages
const String NO_INTERNET_CONNECTION =
    "We're having trouble connecting. Please check your internet connection.";
const String TIMEOUT_ERROR = 'Server timed out';
const String FORMAT_ERROR = 'Formatting error';
const String HTTP_ERROR = 'Oops! An error has occurred';


// Welcome Messages
const String WELCOME_MESSAGE = 'Get ready to connect with Fellow gamers and \nDiscover the Best Games';

//Custom Map Theme
String mapStyle = '''
[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "administrative.province",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "landscape.man_made",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.business",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.government",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.medical",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#181818"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1b1b1b"
      }
    ]
  },
  {
    "featureType": "poi.school",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "poi.sports_complex",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#2c2c2c"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8a8a8a"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#373737"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3c3c3c"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#4e4e4e"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#000000"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#3d3d3d"
      }
    ]
  }
]
''';
