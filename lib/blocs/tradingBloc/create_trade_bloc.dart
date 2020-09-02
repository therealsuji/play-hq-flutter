import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:play_hq/models/search_game_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class CreateTradeBloc{


  BehaviorSubject<int> _selectedItemIndex = BehaviorSubject<int>.seeded(30);
  Stream<int> get getSelectedIndex => _selectedItemIndex.stream;
  StreamController<int> _selectedIndexController = StreamController();
  Sink<int> get setSelectedItemIndex => _selectedIndexController.sink;

  String _parameterString;

  List<GameDetails> _gameDetailsList = [];
  List<GameDetails> _tempList = [];

  //control the modal loader visibility and function
  PublishSubject<bool> _isLoading = PublishSubject<bool>();
  Stream<bool> get isLoading => _isLoading.stream;

  BehaviorSubject<List<GameDetails>> _gameData = BehaviorSubject<List<GameDetails>>();
  Stream<List<GameDetails>> get getGameData => _gameData.stream;
  StreamController<String> _gameNameController = StreamController();
  Sink<String> get setGameName => _gameNameController.sink;


  CreateTradeBloc(){

    _selectedIndexController.stream.listen((event) {
      _selectedItemIndex.add(event);
    });
    
    _gameNameController.stream.debounceTime(Duration(milliseconds: 500)).listen((event) {
      getStreet(event);
    });
    


  }

  Map<String ,  String> _headers = {
    "User-Agent": 'PlayHQ',
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  void getStreet(String parameter) async{

    Client client = Client();
    Response response;
    SearchGame details;
    _gameDetailsList.clear();
    try{
    response = await client.get('https://api.rawg.io/api/games?page=1&search=$parameter' , headers: _headers);
    if(response.statusCode == 200){
      details = SearchGame.fromJson(json.decode(response.body));
      _isLoading.add(true);
    }
    print(details.data.length);
    print('${response.body}');

    details.data.forEach((streetDetails){
      _gameDetailsList.add(streetDetails);
    });
    _gameData.add(_gameDetailsList);


    }catch(error){
      print(error.toString());
    }
  }

  void dispose(){
    _selectedItemIndex.close();
    _isLoading.close();
    _selectedIndexController.close();
    _gameData.close();
    _gameNameController.close();
  }
}