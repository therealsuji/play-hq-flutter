import 'package:play_hq/services/base_managers/exceptions.dart';

abstract class ErrorManager {

  Stream<PlayHQException> get getErrorText;

  void setError(PlayHQException error);

  void noSentryError(PlayHQException error);

  void dispose();

}