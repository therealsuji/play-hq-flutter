import 'dart:async';

import 'package:play_hq/helpers/network_client.dart';
import 'package:play_hq/models/genre_model.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc {
  // On-boarding page position
  BehaviorSubject<int> _pagePosition = BehaviorSubject<int>.seeded(0);
  Stream<int> get getPagePosition => _pagePosition.stream;
  Sink<int> get setPagePosition => _pagePosition.sink;


  // genre selected list
  List<int> genreSelectedIndexList = [];

  // Genre selected Stream and Subject
  BehaviorSubject<List<int>> _genreSelectedSubject = BehaviorSubject<List<int>>();
  Stream<List<int>> get getGenresSelected => _genreSelectedSubject.stream;

  //Genre select Controller and Sink
  StreamController<int> _genreSelectedController = StreamController<int>();
  Sink<int> get setGenreSelected => _genreSelectedController.sink;

  // Genre Pagination Sink and Subject
  PublishSubject<int> _genrePagination  = PublishSubject<int>();
  Stream<int> get getGenrePagination =>_genrePagination.stream;
  Sink<int> get setGenrePagination => _genrePagination.sink;

  // platform Pagination Sink and Subject
  PublishSubject<int> _platformPagination  = PublishSubject<int>();
  Stream<int> get getPlatformPagination =>_platformPagination.stream;
  Sink<int> get setPlatformPagination => _platformPagination.sink;

  // platform selected list
  List<int>platformSelectedIndexList = [];

  // platform selected Stream and Subject
  BehaviorSubject<List<int>> _platformSelectedSubject = BehaviorSubject<List<int>>();
  Stream<List<int>> get getPlatformSelected => _platformSelectedSubject.stream;

  //platform select Controller and Sink
  StreamController<int> _platformSelectedController = StreamController<int>();
  Sink<int> get setPlatformSelected => _platformSelectedController.sink;

  SignUpBloc(){
    _genreSelectedController.stream.listen((index) {
        // remove if already exist
       if(genreSelectedIndexList.contains(index)){
        genreSelectedIndexList.remove(index);
      }else{
        genreSelectedIndexList.add(index);
      }
       _genreSelectedSubject.add(genreSelectedIndexList);
    });

    _platformSelectedController.stream.listen((index) {
        // remove if already exist
       if(platformSelectedIndexList.contains(index)){
         platformSelectedIndexList.remove(index);
      }else{
         platformSelectedIndexList.add(index);
      }
        _platformSelectedSubject.add(platformSelectedIndexList);
    });
  }

  void dispose() {
    _genrePagination.close();
    _genreSelectedSubject.close();
    _genreSelectedController.close();
    _pagePosition.close();
    _platformPagination.close();
    _platformSelectedSubject.close();
    _platformSelectedController.close();
  }
}
