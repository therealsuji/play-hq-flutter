

import 'package:flutter/cupertino.dart';
import 'package:play_hq/models/genre_model.dart';

abstract class SelectGameTypesModel with ChangeNotifier{

  bool get currentState;

  void changeState(bool state);

  List<int> get selectedItems;

  List<GenreModel> get selectedList;

  void addSelectedItems(index);

}