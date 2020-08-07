import 'package:rxdart/rxdart.dart';

class NavBloc{

  PublishSubject<int> _indexSubject = PublishSubject<int>();
  Stream<int> get indexStream => _indexSubject.stream;
  Sink<int> get indexSink => _indexSubject.sink;

  dispose(){
    _indexSubject.close();
  }

}