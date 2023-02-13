import 'package:play_hq/helpers/app_colors.dart';

import 'app_enums.dart';

const List<Map<String , String>> game_conditions = [
  {'name': 'Mint Condition' , 'API_Slug': 'MINT'},
  {'name': 'Very New' , 'API_Slug': 'VERY_NEW'},
  {'name': 'Kinda Used' , 'API_Slug': 'KINDA_USED'},
  {'name': 'Playable' , 'API_Slug': 'PLAYABLE'},
];

const List<Map<String, dynamic>> discoverComponents = [
  {'name': 'Top Rated Games', 'gradient': GRADIENT_COMPONENT_1 , 'imagePath': 'assets/images/discovery_category_1.png' , 'category' : DiscoverCategory.TOP_RATED_GAMES , 'apiType' : GameLists.TOP_RATED_GAMES},
  {'name': 'Most Anticipated Games', 'gradient': GRADIENT_COMPONENT_2 , 'imagePath': 'assets/images/discovery_category_2.png' , 'category' : DiscoverCategory.MOST_ANTICIPATED_GAMES ,'apiType' : GameLists.MOST_ANTICIPATED_GAMES},
  {'name': 'Games of 2022', 'gradient': GRADIENT_COMPONENT_3 , 'imagePath': 'assets/images/discovery_category_3.png' , 'category' : DiscoverCategory.GAMES_OF_2022 , 'apiType' : GameLists.GAMES_OF_2022},
];

const List<Map<String, dynamic>> onboardingData = [
  {'image': 'assets/images/home_onboarding.png', 'title': 'Best Deals in the Market' , 'description':'Your favourite games given to you write at your\nfingertips for awesome prices. These games are\nshown to you according to your gamer preferance!'},
  {'image': 'assets/images/discover_onboarding.png', 'title': 'Latest & Greatest Games' , 'description':'Go through a game database of more than 3000\ngames and stay upto date on the latest and\ntrending games in the world.'},
  {'image': 'assets/images/sales_onboarding.png', 'title': 'Sell any Game Easy' , 'description':'Want to sell a game you aren’t playing anymore?\nWe got you covered! Sell any console game you\nwant in a jiffy!'},
  {'image': 'assets/images/sales_onboarding.png', 'title': 'Track your Order' , 'description':'Whether you’re selling or buying a game, we’ve got\nyou covered from the start to finish of the order.\nTrack your order easy peasy.'}
];

const List<Map<String , dynamic>> testingCarousalData = [
  {'image' : 'https://static.bandainamcoent.eu/high/elden-ring/elden-ring/00-page-setup/elden-ring-new-header-mobile.jpg' , 'title': 'Elden Ring'},
  {'image' : 'https://image.api.playstation.com/vulcan/ap/rnd/202208/0921/3XopdGAJGRy3xNQKnQDvaCRs.png' , 'title': 'Hogwarts Legacy'},
  {'image' : 'https://store-images.s-microsoft.com/image/apps.7076.14541540923841523.c79d523a-7cfd-4ca7-9bd1-ecf63049e304.e187008e-9ba6-4b5b-84cf-105f5df62c0e?mode=scale&q=90&h=1080&w=1920' , 'title': 'Forspoken'},
  {'image' : 'https://assets-prd.ignimgs.com/2022/12/01/callistoprotocol-blogroll-1669873578077.jpg' , 'title': 'Callisto Protocol'},
];

const List<Map<String, dynamic>> platforms = [
  {'id': 187, 'name': 'PlayStation 05'},
  {'id': 18, 'name': 'PlayStation 04'},
  {'id': 16 , 'name': 'PlayStation 03'},
  {'id': 186, 'name': 'Xbox Series S/X'},
  {'id' : 14 , 'name' : 'Xbox 360'},
  {'id':1 , 'name':'Xbox One'},
  {'id':7, 'name':'Nintendo Switch'}
];

const List<Map<String, dynamic>> releaseDates = [
  {'start': '2016-01-01','end':'2018-12-31', 'name': '2015-2017'},
  {'start': '2018-01-01', 'end':'2020-12-31','name': '2018-2020'},
  {'start': '2021-01-01', 'end':'2024-10-31', 'name': '2021-Present'},
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
