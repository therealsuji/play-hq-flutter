import 'dart:async';

import 'package:play_hq/services/base_managers/error.dart';
import 'package:play_hq/services/base_managers/exceptions.dart';

class ErrorService extends ErrorManager {

  final StreamController<PlayHQException> _streamController = StreamController<PlayHQException>();

  @override
  void dispose() => _streamController.close();

  @override
  Stream<PlayHQException> get getErrorText => _streamController.stream;

  @override
  void setError(PlayHQException error) async {
    _streamController.add(error);
    print(error.message);
  }

  @override
  void noSentryError(PlayHQException error) => _streamController.add(error);

}