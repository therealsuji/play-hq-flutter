import 'dart:async';

import 'package:rxdart/rxdart.dart';

class CreateSaleBloc {
  BehaviorSubject<bool> _negotiable = new BehaviorSubject<bool>.seeded(false);
  Stream<bool> get negotiableStream => _negotiable.stream;
  Sink<bool> get setNegotiable => _negotiable.sink;



  void dispose() {
    _negotiable.close();
  }
}
