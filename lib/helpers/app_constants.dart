import 'package:play_hq/helpers/app_colors.dart';

import 'app_enums.dart';

const List<Map<String, dynamic>> playStationPlatforms = [
  {'id': 187, 'name': 'PlayStation 5'},
  {'id': 18, 'name': 'PlayStation 4'},
  {'id': 16, 'name': 'PlayStation 3'},
  {'id': 15, 'name': 'PlayStation 2'},
  {'id': 19, 'name': 'PS Vita'},
  {'id': 17, 'name': 'PSP'}
];

const List<Map<String , String>> game_conditions = [
  {'name': 'Mint Condition' , 'API_Slug': 'MINT'},
  {'name': 'Very New' , 'API_Slug': 'VERY_NEW'},
  {'name': 'Kinda Used' , 'API_Slug': 'KINDA_USED'},
  {'name': 'Playable' , 'API_Slug': 'PLAYABLE'},
];

const List<Map<String, dynamic>> xboxPlatforms = [
  {'id': 186, 'name': 'Xbox Series S/X'},
  {'id': 1, 'name': 'Xbox One'},
  {'id': 14, 'name': 'Xbox 360'},
  {'id': 80, 'name': 'Xbox'}
];

const List<Map<String, dynamic>> discoverComponents = [
  {'name': 'Top Rated Games', 'gradient': GRADIENT_COMPONENT_1 , 'imagePath': 'assets/images/discovery_category_1.png' , 'category' : DiscoverCategory.TOP_RATED_GAMES},
  {'name': 'Most Anticipated Games', 'gradient': GRADIENT_COMPONENT_2 , 'imagePath': 'assets/images/discovery_category_2.png' , 'category' : DiscoverCategory.MOST_ANTICIPATED_GAMES},
  {'name': 'Games of 2022', 'gradient': GRADIENT_COMPONENT_3 , 'imagePath': 'assets/images/discovery_category_3.png' , 'category' : DiscoverCategory.GAMES_OF_2022},
];

const List<Map<String, dynamic>> testerGames = [
  {'id': 2, 'name': 'Call of Duty: Warzone' , 'releaseDate' : '12/02/2019' , 'coverImage' : 'https://m.media-amazon.com/images/M/MV5BZWYxY2VmN2ItNjNlNi00ZmM0LWEwMjEtMTE1NGQxMGVhMWQxXkEyXkFqcGdeQXVyMTk2OTAzNTI@._V1_FMjpg_UX1000_.jpg'},
  {'id': 3, 'name': 'Cyperpunk 2077' , 'releaseDate' : '22/05/2020' , 'coverImage' : 'https://static.wikia.nocookie.net/g-c-a/images/0/0b/Cover-art-6.jpg/revision/latest?cb=20210104020439'},
  {'id': 4, 'name': 'Ghost of Tsushima' , 'releaseDate' : '17/04/2020' , 'coverImage' : 'https://thetomorrowtechnology.co.ke/wp-content/uploads/2020/08/date-sortie-ghost-of-tsushima-ps4-1200x900-1-1.jpg'},
  {'id': 5, 'name': 'Borderlands 3' , 'releaseDate' : '20/01/202' , 'coverImage' : 'https://www.mobygames.com/images/covers/l/591676-borderlands-3-playstation-4-front-cover.jpg'},
  {'id': 6, 'name': 'God of War' , 'releaseDate' : '02/06/2021' , 'coverImage' : 'https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GodofWar_SantaMonicaStudio_S2_1200x1600-fbdf3cbc2980749091d52751ffabb7b7'},
];

const List<Map<String, dynamic>> testerOrders = [
  {
    'games': [
      {
        'id': 1,
        'name': 'Call of Duty: Warzone',
        'releaseDate' : '12/02/2019',
        'coverImage' : 'https://m.media-amazon.com/images/M/MV5BZWYxY2VmN2ItNjNlNi00ZmM0LWEwMjEtMTE1NGQxMGVhMWQxXkEyXkFqcGdeQXVyMTk2OTAzNTI@._V1_FMjpg_UX1000_.jpg',
        'platform': 'PlayStation 5',
      },
      {
        'id': 2,
        'name': 'Cyperpunk 2077',
        'releaseDate' : '22/05/2020',
        'coverImage' : 'https://static.wikia.nocookie.net/g-c-a/images/0/0b/Cover-art-6.jpg/revision/latest?cb=20210104020439',
        'platform': 'PlayStation 5',
      },
      {
        'id': 3,
        'name': 'Ghost of Tsushima',
        'releaseDate' : '17/04/2020',
        'coverImage' : 'https://thetomorrowtechnology.co.ke/wp-content/uploads/2020/08/date-sortie-ghost-of-tsushima-ps4-1200x900-1-1.jpg',
        'platform': 'PlayStation 5',
      },
    ],
    'price': '\$100',
    'status': 'Active',
    'due_date': '12/02/2020',
    'platform': 'PlayStation 4',
  },
  {
    'games': [
      {
        'id': 3,
        'name': 'Far Cry 06',
        'releaseDate': '17/04/2020',
        'coverImage': 'https://image.api.playstation.com/vulcan/img/rnd/202106/0722/s3zMp9o1SdEtPJK267avcCxT.jpg',
        'platform': 'PlayStation 5',
      },
    ],
    'price': '\$40',
    'status': 'Active',
    'due_date': '12/02/2020',
    'platform': 'Xbox One',
  },
  {
    'games': [
      {
        'id': 3,
        'name': 'Ratchet & Clank: Rift Apart',
        'releaseDate': '17/04/2020',
        'coverImage': 'https://i.ytimg.com/vi/ai3o0XtrnM8/maxresdefault.jpg',
      },
      {
        'id': 3,
        'name': 'Battlefield 2042',
        'releaseDate': '17/04/2020',
        'coverImage': 'https://cdn1.epicgames.com/offer/52f57f57120c440fad9bfa0e6c279317/EGS_Battlefield2042_DICE_S1_2560x1440-36f16374c9c29a18a46872795b483d72_2560x1440-36f16374c9c29a18a46872795b483d72',
      },
    ],
    'price': '\$80',
    'status': 'Active',
    'due_date': '12/02/2020',
    'platform': 'PlayStation 5',
  }
];

const List<Map<String, dynamic>> onboardingData = [
  {'image': 'assets/images/home_onboarding.png', 'title': 'Best Deals in the Market' , 'description':'Your favourite games given to you write at your\nfingertips for awesome prices. These games are\nshown to you according to your gamer preferance!'},
  {'image': 'assets/images/discover_onboarding.png', 'title': 'Latest & Greatest Games' , 'description':'Go through a game database of more than 3000\ngames and stay upto date on the latest and\ntrending games in the world.'},
  {'image': 'assets/images/sales_onboarding.png', 'title': 'Sell any Game Easy' , 'description':'Want to sell a game you aren’t playing anymore?\nWe got you covered! Sell any console game you\nwant in a jiffy!'},
  {'image': 'assets/images/sales_onboarding.png', 'title': 'Track your Order' , 'description':'Whether you’re selling or buying a game, we’ve got\nyou covered from the start to finish of the order.\nTrack your order easy peasy.'}
];

const List<Map<String, dynamic>> nintendoConsoles = [
  {'id': 7, 'name': 'Nintendo Switch'},
  {'id': 8, 'name': 'Nintendo 3DS'},
  {'id': 9, 'name': 'Nintendo DS'},

  {'id': 13, 'name': 'Nintendo DSi'},
  {'id': 11, 'name': 'Wii'},
  {'id': 10, 'name': 'Wii U'},
];

const List<Map<String, dynamic>> platforms = [
  {'id': 187, 'name': 'PlayStation 05'},
  {'id': 18, 'name': 'PlayStation 04'},
  {'id': 16 , 'name': 'PlayStation 03'},
  {'id': 186, 'name': 'Xbox Series S/X'},
  {'id':1 , 'name':'Xbox One'},
  {'id':7, 'name':'Nintendo Switch'}
];


const List<Map<String, dynamic>> popularConsoles = [
  {'id': 187, 'name': 'PlayStation 5'},
  {'id': 186, 'name': 'Xbox Series S/X'},
  {'id': 18, 'name': 'PlayStation 4'},
  {'id': 16 , 'name': 'PlayStation 03'},
  {'id': 7, 'name': 'Nintendo Switch'},
  {'id': 1, 'name': 'Xbox One'},
];

const List<Map<String, dynamic>> releaseDates = [
  {'start': '2015-01-01','end':'2016-12-31', 'name': '2015-2017'},
  {'start': '2017-01-01', 'end':'2018-12-31','name': '2017-2019'},
  {'start': '2019-01-01', 'end':'2021-10-31', 'name': '2019-Present'},
  {'start': '2000-01-01', 'end':'2014-12-31' , 'name': 'Old Classics'}
];

const List<Map<String, dynamic>> genreList = [
  {
    "id": 4,
    "name": "Action",
    "image_background":
        "https://media.rawg.io/media/games/83f/83f6f70a7c1b86cd2637b029d8b42caa.jpg",
  },
  {
    "id": 51,
    "name": "Indie",
    "image_background":
        "https://media.rawg.io/media/games/6a2/6a2e48933245e2cd3c92248c75c925e1.jpg",
  },
  {
    "id": 3,
    "name": "Adventure",
    "image_background":
        "https://media.rawg.io/media/games/9aa/9aa42d16d425fa6f179fc9dc2f763647.jpg",
  },
  {
    "id": 5,
    "name": "RPG",
    "image_background":
        "https://media.rawg.io/media/games/14a/14a83c56ff668baaced6e8c8704b6391.jpg",
  },
  {
    "id": 10,
    "name": "Strategy",
    "image_background":
        "https://media.rawg.io/media/screenshots/65c/65c9c15e274705b5fe343e424ce76ec8.jpg",
  },
  {
    "id": 2,
    "name": "Shooter",
    "image_background":
        "https://media.rawg.io/media/games/6c5/6c55e22185876626881b76c11922b073.jpg",
  },
  {
    "id": 40,
    "name": "Casual",
    "image_background":
        "https://media.rawg.io/media/screenshots/4f4/4f4722571e32954af43a4508607c1748.jpg",
  },
  {
    "id": 14,
    "name": "Simulation",
    "image_background":
        "https://media.rawg.io/media/games/283/283e7e600366b0da7021883d27159b27.jpg",
  },
  {
    "id": 7,
    "name": "Puzzle",
    "image_background":
        "https://media.rawg.io/media/screenshots/c97/c97b943741f5fbc936fe054d9d58851d.jpg",
  },
  {
    "id": 11,
    "name": "Arcade",
    "image_background":
        "https://media.rawg.io/media/screenshots/d93/d93e93149d781484bfc9c6ae7b48e1d4.jpg",
  },
  {
    "id": 83,
    "name": "Platformer",
    "image_background":
        "https://media.rawg.io/media/games/4cf/4cfc6b7f1850590a4634b08bfab308ab.jpg",
  },
  {
    "id": 1,
    "name": "Racing",
    "image_background":
        "https://media.rawg.io/media/games/640/6409857596fe6553d3bb5af9a17f6160.jpg",
  },
  {
    "id": 15,
    "name": "Sports",
    "image_background":
        "https://media.rawg.io/media/games/23d/23d78acedbb5f40c9fb64e73af5af65d.jpg",
  },
  {
    "id": 59,
    "name": "Massively Multiplayer",
    "image_background":
        "https://media.rawg.io/media/games/f87/f87457e8347484033cb34cde6101d08d.jpg",
  },
  {
    "id": 19,
    "name": "Family",
    "image_background":
        "https://media.rawg.io/media/screenshots/351/351ee0915fcd5a64e976791794039d5c.jpg",
  },
  {
    "id": 6,
    "name": "Fighting",
    "image_background":
        "https://media.rawg.io/media/screenshots/887/8879d408311d7614162987cc7fbd3750.jpg",
  },
  {
    "id": 28,
    "name": "Board Games",
    "image_background":
        "https://media.rawg.io/media/games/742/7424c1f7d0a8da9ae29cd866f985698b.jpg",
  },
  {
    "id": 34,
    "name": "Educational",
    "image_background":
        "https://media.rawg.io/media/games/7ca/7ca90d463ea0c0252e7d01afe897ffa8.jpg",
  },
  {
    "id": 17,
    "name": "Card",
    "image_background":
        "https://media.rawg.io/media/screenshots/ca2/ca257e3481af0b2c8149d6600440aa85.jpeg",
  }
];
